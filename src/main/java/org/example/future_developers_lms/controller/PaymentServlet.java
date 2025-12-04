package org.example.future_developers_lms.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.future_developers_lms.model.User;
import org.example.future_developers_lms.service.PaymentService;
import org.example.future_developers_lms.service.EnrollmentService;

import java.io.IOException;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    private PaymentService paymentService;
    private EnrollmentService enrollmentService;

    @Override
    public void init() {
        paymentService = new PaymentService();
        enrollmentService = new EnrollmentService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // --- If not logged in ---
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/views/auth/login.jsp");
            return;
        }

        // --- Get payment info from form ---
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        double amount = Double.parseDouble(request.getParameter("amount"));
        String paymentMode = request.getParameter("paymentMode");

        // --- Step 1: Process Payment ---
        boolean success = paymentService.processPayment(user.getUserId(), courseId, amount, paymentMode);

        if (success) {
            // --- Step 2: Get last payment ID ---
            int paymentId = paymentService.getLastInsertedPaymentId(user.getUserId(), courseId);

            // --- Step 3: Update Enrollment Table ---
            boolean updated = enrollmentService.updateEnrollmentAfterPayment(user.getUserId(), courseId, paymentId);

            if (updated) {
                session.setAttribute("message", "✅ Payment successful! You’re now enrolled in the course.");
                response.sendRedirect(request.getContextPath() + "/CourseServlet?action=enrolled");
            } else {
                session.setAttribute("message", "⚠️ Payment succeeded, but enrollment update failed.");
                response.sendRedirect(request.getContextPath() + "/CourseServlet?action=all");
            }

        } else {
            session.setAttribute("message", "❌ Payment failed! Please try again.");
            response.sendRedirect(request.getContextPath() + "/views/student/payment.jsp?courseId=" + courseId);
        }
    }
}
