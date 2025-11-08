package org.example.future_developers_lms.model;


import java.sql.Timestamp;

public class Enrollment {
    private int enrollId;
    private int studentId;
    private int courseId;
    private Timestamp enrollDate;
    private String status;
    private Timestamp completionDate;
    private String paymentStatus;
    private int paymentId;
    private int progress;

    public int getEnrollId() { return enrollId; }
    public void setEnrollId(int enrollId) { this.enrollId = enrollId; }

    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }

    public int getCourseId() { return courseId; }
    public void setCourseId(int courseId) { this.courseId = courseId; }

    public Timestamp getEnrollDate() { return enrollDate; }
    public void setEnrollDate(Timestamp enrollDate) { this.enrollDate = enrollDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Timestamp getCompletionDate() { return completionDate; }
    public void setCompletionDate(Timestamp completionDate) { this.completionDate = completionDate; }

    public String getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }

    public int getPaymentId() { return paymentId; }
    public void setPaymentId(int paymentId) { this.paymentId = paymentId; }

    public int getProgress() { return progress; }
    public void setProgress(int progress) { this.progress = progress; }
}
