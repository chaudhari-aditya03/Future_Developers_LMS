package org.example.future_developers_lms.service;


import org.example.future_developers_lms.dao.EnrollmentDAO;
import org.example.future_developers_lms.model.Enrollment;

import java.util.List;

public class EnrollmentService {

    private final EnrollmentDAO enrollmentDAO;

    public EnrollmentService() {
        this.enrollmentDAO = new EnrollmentDAO();
    }

    /**
     * Count total enrolled courses for a student.
     * @param studentId student's ID
     * @return number of enrolled courses
     */
    public int getEnrolledCourseCount(int studentId) {
        return enrollmentDAO.countByStudent(studentId);
    }

    /**
     * Get all enrolled course records for a student.
     * @param studentId student's ID
     * @return list of enrollment objects
     */
    public List<Enrollment> getEnrollmentsByStudent(int studentId) {
        return enrollmentDAO.getEnrollmentsByStudent(studentId);
    }

    /**
     * Enroll a student into a course.
     * @param enrollment enrollment details
     * @return true if successful
     */
    public boolean enrollStudent(Enrollment enrollment) {
        return enrollmentDAO.insertEnrollment(enrollment);
    }

    /**
     * Check if a student is already enrolled in a given course.
     */
    public boolean isAlreadyEnrolled(int studentId, int courseId) {
        return enrollmentDAO.exists(studentId, courseId);
    }

    /**
     * Update progress or status for a student's course.
     */
    public boolean updateEnrollment(Enrollment enrollment) {
        return enrollmentDAO.updateEnrollment(enrollment);
    }

    /**
     * Remove enrollment (optional for admin/teacher).
     */
    public boolean deleteEnrollment(int enrollId) {
        return enrollmentDAO.deleteEnrollment(enrollId);
    }
}
