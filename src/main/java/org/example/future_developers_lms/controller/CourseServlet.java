package org.example.future_developers_lms.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.future_developers_lms.model.Course;
import org.example.future_developers_lms.model.User;
import org.example.future_developers_lms.service.CourseService;
import org.example.future_developers_lms.service.EnrollmentService;

import java.io.IOException;
import java.util.List;

@WebServlet("/CourseServlet")
public class CourseServlet extends HttpServlet {
    private CourseService courseService;
    private EnrollmentService enrollmentService;

    @Override
    public void init() {
        courseService = new CourseService();
        enrollmentService = new EnrollmentService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "all";

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        switch (action) {

            // ===== Show All Available Courses =====
            case "all": {
                List<Course> allCourses = courseService.getAllCourses();
                request.setAttribute("allCourses", allCourses);
                RequestDispatcher rd = request.getRequestDispatcher("/views/student/Courses.jsp");
                rd.forward(request, response);
                break;
            }

            // ===== Show Enrolled Courses of Student =====
            case "enrolled": {
                if (user == null) {
                    response.sendRedirect(request.getContextPath() + "/views/auth/login.jsp");
                    return;
                }

                List<Course> enrolledCourses = courseService.getEnrolledCourses(user.getUserId());
                request.setAttribute("enrolledCourses", enrolledCourses);
                RequestDispatcher rd = request.getRequestDispatcher("/views/student/enrolledCourses.jsp");
                rd.forward(request, response);
                break;
            }

            default:
                response.sendRedirect(request.getContextPath() + "/views/student/dashboard.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/views/auth/login.jsp");
            return;
        }

        // ===== Enroll in a Course =====
        if ("enroll".equalsIgnoreCase(action)) {
            int courseId = Integer.parseInt(request.getParameter("courseId"));
            boolean enrolled = enrollmentService.enrollStudent(user.getUserId(), courseId);

            if (enrolled) {
                // ✅ Redirect to payment page for this course
                response.sendRedirect(request.getContextPath() + "/views/student/payment.jsp?courseId=" + courseId);
            } else {
                session.setAttribute("message", "⚠️ Already enrolled or error occurred!");
                response.sendRedirect(request.getContextPath() + "/CourseServlet?action=enrolled");
            }
        }

    }
}
