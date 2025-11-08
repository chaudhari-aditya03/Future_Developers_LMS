package org.example.future_developers_lms.model;

import java.sql.Timestamp;

public class Attendance {
    private int attendanceId;
    private int studentId;
    private int lectureId;
    private String status;
    private Timestamp markedAt;
    private Timestamp updatedAt;

    public int getAttendanceId() { return attendanceId; }
    public void setAttendanceId(int attendanceId) { this.attendanceId = attendanceId; }

    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }

    public int getLectureId() { return lectureId; }
    public void setLectureId(int lectureId) { this.lectureId = lectureId; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Timestamp getMarkedAt() { return markedAt; }
    public void setMarkedAt(Timestamp markedAt) { this.markedAt = markedAt; }

    public Timestamp getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Timestamp updatedAt) { this.updatedAt = updatedAt; }


    public boolean getCourseName() {
        return false;
    }

    public boolean getLectureDate() {
        return false;
    }

    public String getRemarks() {
        return null;
    }
}
