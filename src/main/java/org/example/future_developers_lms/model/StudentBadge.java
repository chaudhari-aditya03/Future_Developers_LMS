package org.example.future_developers_lms.model;


import java.sql.Timestamp;

public class StudentBadge {
    private int studentId;
    private int badgeId;
    private Timestamp awardedAt;

    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }

    public int getBadgeId() { return badgeId; }
    public void setBadgeId(int badgeId) { this.badgeId = badgeId; }

    public Timestamp getAwardedAt() { return awardedAt; }
    public void setAwardedAt(Timestamp awardedAt) { this.awardedAt = awardedAt; }
}
