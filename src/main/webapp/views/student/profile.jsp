<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.example.future_developers_lms.model.User" %>
<%
    User student = (User) request.getAttribute("student");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Student Profile | Future Developers LMS</title>

    <!-- CSS -->
    <link rel="stylesheet" href="../assets/css/style.css" />
    <link rel="stylesheet" href="../assets/css/dashboard.css" />

    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a2c1234567.js" crossorigin="anonymous"></script>
</head>
<body>

<!-- ===== SIDEBAR ===== -->
<aside class="sidebar">
    <div class="sidebar-header">
        <img src="../images/FD.jpeg" alt="Logo" class="sidebar-logo">
        <h2>Future Developers</h2>
    </div>

    <ul class="sidebar-menu">
        <li><a href="dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li class="active"><a href="profile.jsp"><i class="fas fa-user"></i> Profile</a></li>
        <li><a href="enrolledCourses.jsp"><i class="fas fa-book"></i> Courses</a></li>
        <li><a href="lectures.jsp"><i class="fas fa-video"></i> Lectures</a></li>
        <li><a href="attendance.jsp"><i class="fas fa-check-circle"></i> Attendance</a></li>
        <li><a href="notes.jsp"><i class="fas fa-file-alt"></i> Notes</a></li>
        <li><a href="tests.jsp"><i class="fas fa-pen"></i> Tests</a></li>
        <li><a href="payments.jsp"><i class="fas fa-wallet"></i> Payments</a></li>
        <li><a href="progress.jsp"><i class="fas fa-chart-line"></i> Progress</a></li>
        <li><a href="feedback.jsp"><i class="fas fa-comment-dots"></i> Feedback</a></li>
    </ul>

    <div class="sidebar-footer">
        <form action="<%=request.getContextPath()%>/LogoutServlet" method="post">
            <button type="submit" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</button>
        </form>
    </div>
</aside>

<!-- ===== MAIN CONTENT ===== -->
<main class="main-content">
    <header class="dashboard-header">
        <h1>👤 My Profile</h1>
    </header>

    <!-- ===== PROFILE FORM ===== -->
    <section class="profile-section">
        <div class="profile-box">
            <h2>Personal Information</h2>
            <form action="<%=request.getContextPath()%>/UpdateProfileServlet" method="post"
                  class="profile-form" enctype="multipart/form-data">

                <!-- Profile Photo -->
                <div class="form-group photo-upload">
                    <label>Profile Photo</label>
                    <img src="<%= student != null && student.getProfilePhoto() != null ?
                                "../uploads/" + student.getProfilePhoto() : "../images/student-avatar.png" %>"
                         alt="Profile Photo" class="profile-avatar-large">
                    <input type="file" name="profilePhoto" accept="image/*">
                </div>

                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" name="fullName" value="<%= student != null ? student.getFullName() : "" %>" readonly>
                </div>

                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" value="<%= student != null ? student.getEmail() : "" %>" readonly>
                </div>

                <div class="form-group">
                    <label>Phone</label>
                    <input type="text" name="phone" value="<%= student != null ? student.getPhone() : "" %>" placeholder="Enter phone number">
                </div>

                <div class="form-group">
                    <label>Age</label>
                    <input type="number" name="age" value="<%= student != null ? student.getAge() : "" %>" placeholder="Enter your age">
                </div>

                <div class="form-group">
                    <label>Gender</label>
                    <select name="gender">
                        <option value="">-- Select Gender --</option>
                        <option value="Male" <%= student != null && "Male".equals(student.getGender()) ? "selected" : "" %>>Male</option>
                        <option value="Female" <%= student != null && "Female".equals(student.getGender()) ? "selected" : "" %>>Female</option>
                        <option value="Other" <%= student != null && "Other".equals(student.getGender()) ? "selected" : "" %>>Other</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Address</label>
                    <textarea name="address" placeholder="Enter your address"><%= student != null ? student.getAddress() : "" %></textarea>
                </div>

<%--                <div class="form-group">--%>
<%--                    <label>Education</label>--%>
<%--                    <input type="text" name="education" value="<%= student != null ? student. : "" %>" placeholder="Enter your qualification">--%>
<%--                </div>--%>

                <button type="submit" class="btn-primary w-full">Update Profile</button>
            </form>
        </div>
    </section>
</main>

<!-- ===== JS ===== -->
<script src="../student/js/dashboard.js"></script>
<script src="../student/js/profile.js"></script>

</body>
</html>
