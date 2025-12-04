package org.example.future_developers_lms.dao;

import org.example.future_developers_lms.model.Course;
import org.example.future_developers_lms.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CourseDAO {

    public List<Course> getAllCourses() {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT * FROM courses"; // remove status filter for now
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Course c = new Course();
                c.setCourseId(rs.getInt("course_id"));
                c.setTitle(rs.getString("title"));
                c.setDescription(rs.getString("description"));
                c.setCategory(rs.getString("category"));
                c.setDuration(rs.getString("duration"));
                c.setPrice(rs.getDouble("price"));
                c.setLevel(rs.getString("level"));
                c.setTeacherId(rs.getInt("teacher_id"));
                c.setThumbnail(rs.getString("thumbnail"));
                c.setStatus(rs.getString("status"));
                c.setCreatedAt(rs.getTimestamp("created_at"));
                c.setUpdatedAt(rs.getTimestamp("updated_at"));
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Course> getEnrolledCourses(int studentId) {
        List<Course> list = new ArrayList<>();
        String sql = """
                SELECT c.* FROM courses c 
                JOIN enrollments e ON c.course_id = e.course_id
                WHERE e.student_id = ?
                """;
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Course c = new Course();
                c.setCourseId(rs.getInt("course_id"));
                c.setTitle(rs.getString("title"));
                c.setDescription(rs.getString("description"));
                c.setCategory(rs.getString("category"));
                c.setDuration(rs.getString("duration"));
                c.setPrice(rs.getDouble("price"));
                c.setLevel(rs.getString("level"));
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Course getCourseById(int courseId) {
        Course course = null;
        String sql = "SELECT * FROM courses WHERE course_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, courseId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                course = new Course();
                course.setCourseId(rs.getInt("course_id"));
                course.setTitle(rs.getString("title"));
                course.setCategory(rs.getString("category"));
                course.setDuration(rs.getString("duration"));
                course.setLevel(rs.getString("level"));
                course.setDescription(rs.getString("description"));
                course.setPrice(rs.getDouble("price"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return course;
    }
}
