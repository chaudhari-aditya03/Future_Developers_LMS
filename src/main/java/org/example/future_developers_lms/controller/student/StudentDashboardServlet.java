package org.example.future_developers_lms.controller.student;


import org.example.future_developers_lms.model.User;
import org.example.future_developers_lms.service.AttendanceService;
import org.example.future_developers_lms.service.EnrollmentService;
import org.example.future_developers_lms.service.LectureService;
import org.example.future_developers_lms.service.TestService;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/StudentDashboardServlet")
public class StudentDashboardServlet extends HttpServlet {

    private EnrollmentService enrollmentService;
    private LectureService lectureService;
    private AttendanceService attendanceService;
    private TestService testService;

    @Override
    public void init() throws ServletException {
        enrollmentService = new EnrollmentService();
        lectureService = new LectureService();
        attendanceService = new AttendanceService();
        testService = new TestService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = (User) (session != null ? session.getAttribute("user") : null);

        // Security + Role check
        if (user == null || !"STUDENT".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/views/auth/login.jsp");
            return;
        }

        int studentId = user.getUserId();

        // Fetch dashboard data using service layer
        int enrolledCourses = enrollmentService.getEnrolledCourseCount(studentId);
        int completedLectures = lectureService.getCompletedLectureCount(studentId);
        double attendancePercent = attendanceService.getAttendancePercentage(studentId);
        int upcomingTests = testService.getUpcomingTestsCount(studentId);

        // Set attributes for JSP
        request.setAttribute("enrolledCourses", enrolledCourses);
        request.setAttribute("completedLectures", completedLectures);
        request.setAttribute("attendancePercent", attendancePercent);
        request.setAttribute("upcomingTests", upcomingTests);

        // Forward to dashboard JSP
        RequestDispatcher rd = request.getRequestDispatcher("/views/student/studentdashboard.jsp");
        rd.forward(request, response);
    }
}
