package org.example.future_developers_lms.service;

import org.example.future_developers_lms.dao.CourseDAO;
import org.example.future_developers_lms.model.Course;
import java.util.List;

public class CourseService {
    private final CourseDAO courseDAO = new CourseDAO();

    public List<Course> getAllCourses() {
        return courseDAO.getAllCourses();
    }

    public List<Course> getEnrolledCourses(int studentId) {
        return courseDAO.getEnrolledCourses(studentId);
    }

    public Course getCourseById(int courseId) {
        return courseDAO.getCourseById(courseId);
    }
}
