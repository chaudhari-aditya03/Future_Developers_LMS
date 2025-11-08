package org.example.future_developers_lms.model;



import java.sql.Timestamp;

public class CourseFeedback {
    private int feedbackId;
    private int studentId;
    private int courseId;
    private int rating;
    private String comment;
    private Timestamp submittedAt;

    public int getFeedbackId() { return feedbackId; }
    public void setFeedbackId(int feedbackId) { this.feedbackId = feedbackId; }

    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }

    public int getCourseId() { return courseId; }
    public void setCourseId(int courseId) { this.courseId = courseId; }

    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }

    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }

    public Timestamp getSubmittedAt() { return submittedAt; }
    public void setSubmittedAt(Timestamp submittedAt) { this.submittedAt = submittedAt; }

    public boolean getSubject() {
        return false;
    }

    public boolean getMessage() {
        return false;
    }

    public String getStatus() {
        return null;
    }

    public Timestamp getSubmittedDate() {
        return submittedAt;
    }
}

