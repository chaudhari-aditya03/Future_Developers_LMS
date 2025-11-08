package org.example.future_developers_lms.model;


import java.sql.Timestamp;

public class TestResult {
    private int resultId;
    private int testId;
    private int studentId;
    private double obtainedMarks;
    private String status;
    private String remarks;
    private Timestamp submittedAt;
    private int gradedBy;
    private Timestamp gradedAt;

    public int getResultId() { return resultId; }
    public void setResultId(int resultId) { this.resultId = resultId; }

    public int getTestId() { return testId; }
    public void setTestId(int testId) { this.testId = testId; }

    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }

    public double getObtainedMarks() { return obtainedMarks; }
    public void setObtainedMarks(double obtainedMarks) { this.obtainedMarks = obtainedMarks; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getRemarks() { return remarks; }
    public void setRemarks(String remarks) { this.remarks = remarks; }

    public Timestamp getSubmittedAt() { return submittedAt; }
    public void setSubmittedAt(Timestamp submittedAt) { this.submittedAt = submittedAt; }

    public int getGradedBy() { return gradedBy; }
    public void setGradedBy(int gradedBy) { this.gradedBy = gradedBy; }

    public Timestamp getGradedAt() { return gradedAt; }
    public void setGradedAt(Timestamp gradedAt) { this.gradedAt = gradedAt; }
}
