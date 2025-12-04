package org.example.future_developers_lms.service;

import org.example.future_developers_lms.dao.EnrollmentDAO;

public class EnrollmentService {
    private final EnrollmentDAO dao = new EnrollmentDAO();

    public boolean enrollStudent(int studentId, int courseId) {
        return dao.enrollStudent(studentId, courseId);
    }
    public boolean updateEnrollmentAfterPayment(int studentId, int courseId, int paymentId) {
        return dao.updateAfterPayment(studentId, courseId, paymentId);
    }


    public boolean isCourseActive(int userId, int courseId) {
        return dao.isCourseActive(userId, courseId);
    }
}
