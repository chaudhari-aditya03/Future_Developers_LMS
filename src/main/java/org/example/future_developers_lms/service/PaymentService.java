package org.example.future_developers_lms.service;

import org.example.future_developers_lms.dao.PaymentDAO;
import org.example.future_developers_lms.model.Payment;

public class PaymentService {
    private PaymentDAO paymentDAO = new PaymentDAO();

    public boolean processPayment(int studentId, int courseId, double amount, String mode) {
        Payment payment = new Payment();
        payment.setStudentId(studentId);
        payment.setCourseId(courseId);
        payment.setAmount(amount);
        payment.setPaymentMode(mode);
        payment.setTransactionId("TXN" + System.currentTimeMillis());
        payment.setStatus("SUCCESS");

        return paymentDAO.savePayment(payment);
    }
    public int getLastInsertedPaymentId(int studentId, int courseId) {
        return paymentDAO.getLastInsertedPaymentId(studentId, courseId);
    }

}
