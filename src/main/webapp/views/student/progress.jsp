<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Progress | Future Developers LMS</title>

    <!-- ===== CSS FILES ===== -->
    <link rel="stylesheet" href="../assets/css/style.css" />
    <link rel="stylesheet" href="../assets/css/dashboard.css" />
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
        <li><a href="<%= request.getContextPath() %>/student/dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="<%= request.getContextPath() %>/student/profile.jsp"><i class="fas fa-user"></i> Profile</a></li>
        <li><a href="<%= request.getContextPath() %>/student/enrolledCourses.jsp"><i class="fas fa-book"></i> Courses</a></li>
        <li><a href="<%= request.getContextPath() %>/student/lectures.jsp"><i class="fas fa-video"></i> Lectures</a></li>
        <li><a href="<%= request.getContextPath() %>/student/attendance.jsp"><i class="fas fa-check-circle"></i> Attendance</a></li>
        <li><a href="<%= request.getContextPath() %>/student/notes.jsp"><i class="fas fa-file-alt"></i> Notes</a></li>
        <li><a href="<%= request.getContextPath() %>/student/tests.jsp"><i class="fas fa-pen"></i> Tests</a></li>
        <li><a href="<%= request.getContextPath() %>/student/payments.jsp"><i class="fas fa-wallet"></i> Payments</a></li>
        <li class="active"><a href="<%= request.getContextPath() %>/student/progress.jsp"><i class="fas fa-chart-line"></i> Progress</a></li>
        <li><a href="<%= request.getContextPath() %>/student/feedback.jsp"><i class="fas fa-comment-dots"></i> Feedback</a></li>
    </ul>

    <div class="sidebar-footer">
        <form action="<%= request.getContextPath() %>/LogoutServlet" method="post">
            <button type="submit" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</button>
        </form>
    </div>
</aside>

<!-- ===== MAIN CONTENT ===== -->
<main class="main-content">
    <header class="dashboard-header">
        <h1>Progress & Analytics</h1>
    </header>

    <!-- ===== COURSE COMPLETION ===== -->
    <section class="progress-section">
        <h2>Course Completion</h2>
        <div class="progress-cards">
            <div class="progress-card">
                <h3>Java Full Stack</h3>
                <div class="progress-bar">
                    <div class="progress-fill" style="width: 75%;"></div>
                </div>
                <p>75% completed</p>
            </div>

            <div class="progress-card">
                <h3>Spring Boot</h3>
                <div class="progress-bar">
                    <div class="progress-fill" style="width: 50%;"></div>
                </div>
                <p>50% completed</p>
            </div>

            <div class="progress-card">
                <h3>Frontend Basics</h3>
                <div class="progress-bar">
                    <div class="progress-fill" style="width: 90%;"></div>
                </div>
                <p>90% completed</p>
            </div>
        </div>
    </section>

    <!-- ===== TEST SCORES ===== -->
    <section class="progress-section">
        <h2>Test Scores</h2>
        <table class="progress-table">
            <thead>
            <tr>
                <th>Course</th>
                <th>Test</th>
                <th>Score</th>
                <th>Max Score</th>
                <th>Percentage</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Java Full Stack</td>
                <td>OOP Concepts</td>
                <td>80</td>
                <td>100</td>
                <td>80%</td>
            </tr>
            <tr>
                <td>Spring Boot</td>
                <td>REST API</td>
                <td>60</td>
                <td>100</td>
                <td>60%</td>
            </tr>
            <tr>
                <td>Frontend Basics</td>
                <td>HTML & CSS</td>
                <td>90</td>
                <td>100</td>
                <td>90%</td>
            </tr>
            </tbody>
        </table>
    </section>

    <!-- ===== ATTENDANCE PERFORMANCE ===== -->
    <section class="progress-section">
        <h2>Attendance Performance</h2>
        <div class="attendance-cards">
            <div class="attendance-card">
                <h3>Java Full Stack</h3>
                <p>92% attended</p>
            </div>
            <div class="attendance-card">
                <h3>Spring Boot</h3>
                <p>85% attended</p>
            </div>
            <div class="attendance-card">
                <h3>Frontend Basics</h3>
                <p>97% attended</p>
            </div>
        </div>
    </section>
</main>

<!-- ===== JS FILES ===== -->
<script src="../student/js/dashboard.js"></script>
<script src="../student/js/progress.js"></script>
</body>
</html>
