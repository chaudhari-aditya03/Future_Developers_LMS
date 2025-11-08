package org.example.future_developers_lms.dao;

import org.example.future_developers_lms.model.Enrollment;
import org.example.future_developers_lms.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EnrollmentDAO {

    private final Connection conn;

    public EnrollmentDAO() {
        this.conn = DBConnection.getConnection();
    }

    /**
     * Count total enrolled courses for a student.
     * @param studentId Student ID
     * @return Total course count
     */
    public int countByStudent(int studentId) {
        String sql = "SELECT COUNT(*) FROM enrollments WHERE student_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            System.out.println("❌ Error counting enrollments: " + e.getMessage());
        }
        return 0;
    }

    /**
     * Get all enrollments for a specific student.
     */
    public List<Enrollment> getEnrollmentsByStudent(int studentId) {
        List<Enrollment> list = new ArrayList<>();
        String sql = "SELECT * FROM enrollments WHERE student_id = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Enrollment e = new Enrollment();
                e.setEnrollId(rs.getInt("enroll_id"));
                e.setStudentId(rs.getInt("student_id"));
                e.setCourseId(rs.getInt("course_id"));
                e.setStatus(rs.getString("status"));
                e.setProgress(rs.getInt("progress"));
                e.setPaymentStatus(rs.getString("payment_status"));
                e.setPaymentId(rs.getInt("payment_id"));
                e.setEnrollDate(rs.getTimestamp("enroll_date"));
                e.setCompletionDate(rs.getTimestamp("completion_date"));
                list.add(e);
            }
        } catch (SQLException e) {
            System.out.println("❌ Error fetching enrollments: " + e.getMessage());
        }
        return list;
    }

    /**
     * Insert new enrollment for a student into a course.
     */
    public boolean insertEnrollment(Enrollment enrollment) {
        String sql = """
                INSERT INTO enrollments (student_id, course_id, status, payment_status, progress)
                VALUES (?, ?, ?, ?, ?)
                """;
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, enrollment.getStudentId());
            ps.setInt(2, enrollment.getCourseId());
            ps.setString(3, enrollment.getStatus());
            ps.setString(4, enrollment.getPaymentStatus());
            ps.setInt(5, enrollment.getProgress());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("❌ Error inserting enrollment: " + e.getMessage());
        }
        return false;
    }

    /**
     * Check if the student is already enrolled in a given course.
     */
    public boolean exists(int studentId, int courseId) {
        String sql = "SELECT 1 FROM enrollments WHERE student_id = ? AND course_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, studentId);
            ps.setInt(2, courseId);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println("❌ Error checking enrollment existence: " + e.getMessage());
        }
        return false;
    }

    /**
     * Update enrollment progress or status (e.g., completed or in progress).
     */
    public boolean updateEnrollment(Enrollment e) {
        String sql = "UPDATE enrollments SET status = ?, progress = ?, completion_date = ? WHERE enroll_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, e.getStatus());
            ps.setInt(2, e.getProgress());
            ps.setTimestamp(3, e.getCompletionDate());
            ps.setInt(4, e.getEnrollId());
            return ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.out.println("❌ Error updating enrollment: " + ex.getMessage());
        }
        return false;
    }

    /**
     * Delete enrollment by ID (for admin/teacher use).
     */
    public boolean deleteEnrollment(int enrollId) {
        String sql = "DELETE FROM enrollments WHERE enroll_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, enrollId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("❌ Error deleting enrollment: " + e.getMessage());
        }
        return false;
    }
}
