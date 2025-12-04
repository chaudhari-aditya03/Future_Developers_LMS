package org.example.future_developers_lms.dao;

import org.example.future_developers_lms.util.DBConnection;

import java.sql.*;

public class EnrollmentDAO {

    public boolean enrollStudent(int studentId, int courseId) {
        String check = "SELECT * FROM enrollments WHERE student_id=? AND course_id=?";
        String insert = "INSERT INTO enrollments (student_id, course_id, enroll_date, status, payment_status, progress) VALUES (?, ?, NOW(), 'ACTIVE', 'PENDING', 0)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps1 = conn.prepareStatement(check)) {
            ps1.setInt(1, studentId);
            ps1.setInt(2, courseId);
            ResultSet rs = ps1.executeQuery();

            if (rs.next()) return false; // already enrolled

            PreparedStatement ps2 = conn.prepareStatement(insert);
            ps2.setInt(1, studentId);
            ps2.setInt(2, courseId);
            return ps2.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean updateAfterPayment(int studentId, int courseId, int paymentId) {
        String sql = "UPDATE enrollments SET status='ENROLLED', payment_status='PAID', payment_id=? WHERE student_id=? AND course_id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, paymentId);
            ps.setInt(2, studentId);
            ps.setInt(3, courseId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean isCourseActive(int studentId, int courseId) {
        String sql = "SELECT status FROM enrollments WHERE student_id=? AND course_id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, studentId);
            ps.setInt(2, courseId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return "ACTIVE".equalsIgnoreCase(rs.getString("status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


}
