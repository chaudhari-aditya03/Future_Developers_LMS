package org.example.future_developers_lms.dao;

import org.example.future_developers_lms.model.Payment;
import org.example.future_developers_lms.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

public class PaymentDAO {

    public boolean savePayment(Payment payment) {
        String sql = "INSERT INTO payments (student_id, course_id, amount, payment_mode, transaction_id, status, payment_date) " +
                "VALUES (?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, payment.getStudentId());
            ps.setInt(2, payment.getCourseId());
            ps.setDouble(3, payment.getAmount());
            ps.setString(4, payment.getPaymentMode());
            ps.setString(5, payment.getTransactionId());
            ps.setString(6, payment.getStatus());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int getLastInsertedPaymentId(int studentId, int courseId) {
        String sql = "SELECT payment_id FROM payments WHERE student_id=? AND course_id=? ORDER BY payment_date DESC LIMIT 1";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, studentId);
            ps.setInt(2, courseId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt("payment_id");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

}
