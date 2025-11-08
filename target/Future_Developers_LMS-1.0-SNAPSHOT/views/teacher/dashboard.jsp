<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Teacher Dashboard | Future Developers LMS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        /* General Reset */
        * {margin: 0; padding: 0; box-sizing: border-box; font-family: 'Poppins', sans-serif;}

        body {
            display: flex;
            background-color: #f4f6f8;
            color: #333;
        }

        /* ===== SIDEBAR ===== */
        .sidebar {
            width: 250px;
            background-color: #1a237e;
            color: white;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            position: fixed;
        }

        .sidebar-header {
            text-align: center;
            padding: 20px 10px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .sidebar-header img {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            margin-bottom: 10px;
        }

        .sidebar h2 {
            font-size: 1.2rem;
            color: #fff;
        }

        .sidebar-menu {
            list-style: none;
            padding: 20px 0;
        }

        .sidebar-menu li {
            padding: 10px 20px;
        }

        .sidebar-menu li a {
            color: #c5cae9;
            text-decoration: none;
            font-size: 0.95rem;
            display: flex;
            align-items: center;
            transition: 0.3s;
        }

        .sidebar-menu li a i {
            margin-right: 10px;
        }

        .sidebar-menu li.active, .sidebar-menu li:hover {
            background-color: #303f9f;
        }

        .sidebar-footer {
            padding: 15px;
            text-align: center;
            border-top: 1px solid rgba(255, 255, 255, 0.2);
        }

        .logout-btn {
            background-color: #e53935;
            border: none;
            color: #fff;
            padding: 10px 25px;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .logout-btn:hover { background-color: #c62828; }

        /* ===== MAIN CONTENT ===== */
        .main-content {
            margin-left: 250px;
            padding: 30px;
            width: calc(100% - 250px);
        }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: white;
            padding: 15px 25px;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }

        .dashboard-header h1 {
            font-size: 1.5rem;
            color: #1a237e;
        }

        .profile-summary {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .profile-summary img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
        }

        /* ===== DASHBOARD CARDS ===== */
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 20px;
        }

        .card {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card i {
            font-size: 30px;
            color: #1a237e;
            margin-bottom: 10px;
        }

        .card h3 {
            font-size: 1.5rem;
            color: #333;
        }

        .card p {
            color: #666;
            font-size: 0.9rem;
        }

        /* ===== SECTION STYLING ===== */
        .recent-section {
            margin-top: 40px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        .recent-section h2 {
            color: #1a237e;
            margin-bottom: 15px;
        }

        .notes-list li {
            list-style: none;
            padding: 8px 0;
            border-bottom: 1px solid #eee;
        }

        .notes-list li:last-child {
            border-bottom: none;
        }

        /* ===== RESPONSIVE ===== */
        @media (max-width: 768px) {
            .sidebar { display: none; }
            .main-content { margin-left: 0; width: 100%; }
        }
    </style>
</head>

<body>
<aside class="sidebar">
    <div class="sidebar-header">
        <img src="../images/FD.jpeg" alt="Logo">
        <h2>Future Developers</h2>
    </div>

    <ul class="sidebar-menu">
        <li class="active"><a href="#"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="teacher-courses.jsp"><i class="fas fa-book"></i> My Courses</a></li>
        <li><a href="teacher-lectures.jsp"><i class="fas fa-video"></i> Lectures</a></li>
        <li><a href="teacher-notes.jsp"><i class="fas fa-file-alt"></i> Notes</a></li>
        <li><a href="teacher-tests.jsp"><i class="fas fa-pen"></i> Tests</a></li>
        <li><a href="teacher-results.jsp"><i class="fas fa-chart-bar"></i> Results</a></li>
        <li><a href="teacher-attendance.jsp"><i class="fas fa-check-circle"></i> Attendance</a></li>
        <li><a href="teacher-reports.jsp"><i class="fas fa-chart-line"></i> Reports</a></li>
        <li><a href="teacher-profile.jsp"><i class="fas fa-user-cog"></i> Profile</a></li>
    </ul>

    <div class="sidebar-footer">
        <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
            <button type="submit" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</button>
        </form>
    </div>
</aside>

<main class="main-content">
    <header class="dashboard-header">
        <h1>Welcome, <span>${teacher.name}</span> 👋</h1>
        <div class="profile-summary">
            <img src="../images/teacher.png" alt="Teacher">
            <div>
                <p><strong>ID:</strong> ${teacher.teacherId}</p>
                <p><strong>Department:</strong> ${teacher.department}</p>
            </div>
        </div>
    </header>

    <!-- Cards Section -->
    <section class="dashboard-cards">
        <div class="card">
            <i class="fas fa-user-graduate"></i>
            <h3>${teacher.totalStudents}</h3>
            <p>Total Students</p>
        </div>
        <div class="card">
            <i class="fas fa-book-open"></i>
            <h3>${teacher.activeCourses}</h3>
            <p>Active Courses</p>
        </div>
        <div class="card">
            <i class="fas fa-video"></i>
            <h3>${teacher.uploadedLectures}</h3>
            <p>Uploaded Lectures</p>
        </div>
        <div class="card">
            <i class="fas fa-pen"></i>
            <h3>${teacher.testsCreated}</h3>
            <p>Tests Created</p>
        </div>
        <div class="card">
            <i class="fas fa-chart-pie"></i>
            <h3>${teacher.avgAttendance}%</h3>
            <p>Average Attendance</p>
        </div>
    </section>

    <!-- Upcoming Tests -->
    <section class="recent-section">
        <h2>Upcoming Tests</h2>
        <ul class="notes-list">
            <c:forEach var="test" items="${upcomingTests}">
                <li><strong>${test.testName}</strong> — ${test.date}</li>
            </c:forEach>
        </ul>
    </section>

    <!-- Course Stats -->
    <section class="recent-section">
        <h2>Course Statistics</h2>
        <ul class="notes-list">
            <c:forEach var="course" items="${courseStats}">
                <li><strong>${course.courseName}:</strong> ${course.avgAttendance}% Avg Attendance</li>
            </c:forEach>
        </ul>
    </section>
</main>

<script src="https://kit.fontawesome.com/a2c1234567.js" crossorigin="anonymous"></script>
</body>
</html>
