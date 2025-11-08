package org.example.future_developers_lms.model;


import java.sql.Timestamp;

public class Test {
    private int testId;
    private int courseId;
    private String title;
    private String description;
    private int totalMarks;
    private int passMarks;
    private String testType;
    private Timestamp deadline;
    private int createdBy;
    private Timestamp createdAt;
    private String status;

    public int getTestId() { return testId; }
    public void setTestId(int testId) { this.testId = testId; }

    public int getCourseId() { return courseId; }
    public void setCourseId(int courseId) { this.courseId = courseId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public int getTotalMarks() { return totalMarks; }
    public void setTotalMarks(int totalMarks) { this.totalMarks = totalMarks; }

    public int getPassMarks() { return passMarks; }
    public void setPassMarks(int passMarks) { this.passMarks = passMarks; }

    public String getTestType() { return testType; }
    public void setTestType(String testType) { this.testType = testType; }

    public Timestamp getDeadline() { return deadline; }
    public void setDeadline(Timestamp deadline) { this.deadline = deadline; }

    public int getCreatedBy() { return createdBy; }
    public void setCreatedBy(int createdBy) { this.createdBy = createdBy; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
