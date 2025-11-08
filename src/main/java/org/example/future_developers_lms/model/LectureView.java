package org.example.future_developers_lms.model;


import java.sql.Timestamp;

public class LectureView {
    private int viewId;
    private int lectureId;
    private int studentId;
    private Timestamp viewedAt;

    public int getViewId() { return viewId; }
    public void setViewId(int viewId) { this.viewId = viewId; }

    public int getLectureId() { return lectureId; }
    public void setLectureId(int lectureId) { this.lectureId = lectureId; }

    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }

    public Timestamp getViewedAt() { return viewedAt; }
    public void setViewedAt(Timestamp viewedAt) { this.viewedAt = viewedAt; }
}
