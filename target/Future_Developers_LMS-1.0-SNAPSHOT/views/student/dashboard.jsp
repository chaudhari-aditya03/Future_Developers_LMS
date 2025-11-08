<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.future_developers_lms.model.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<%
    // --- SESSION VALIDATION ---
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/views/auth/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard | Future Developers LMS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Font & Icons -->
    <script src="https://kit.fontawesome.com/a2c1234567.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary-color: #1e90a1;
            --sidebar-bg: #1e90a1;
            --sidebar-hover: rgba(255, 255, 255, 0.15);
            --sidebar-active: rgba(255, 255, 255, 0.25);
            --main-bg: #f8fcfb;
            --card-bg: #fff;
            --shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }

        body {
            display: flex;
            background: var(--main-bg);
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
        }

        /* ===== SIDEBAR ===== */
        .sidebar {
            width: 250px;
            background: var(--sidebar-bg);
            color: white;
            height: 100vh;
            position: fixed;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .sidebar-header {
            text-align: center;
            padding: 1.5rem 0;
            border-bottom: 1px solid rgba(255,255,255,0.2);
        }

        .sidebar-logo {
            height: 60px;
            border-radius: 8px;
        }

        .sidebar-menu {
            list-style: none;
            padding: 1rem;
        }

        .sidebar-menu li {
            margin-bottom: 5px;
        }

        .sidebar-menu li a {
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 10px 20px;
            border-radius: 8px;
            transition: background 0.3s;
        }

        .sidebar-menu li a:hover,
        .sidebar-menu li.active a {
            background: var(--sidebar-active);
        }

        .sidebar-footer {
            text-align: center;
            padding: 1rem;
            border-top: 1px solid rgba(255,255,255,0.2);
        }

        .logout-btn {
            background: #1e1e2f;
            color: white;
            border: none;
            padding: 0.6rem 1.2rem;
            border-radius: 25px;
            cursor: pointer;
        }

        .logout-btn:hover {
            background: #111;
        }

        /* ===== MAIN ===== */
        .main-content {
            margin-left: 250px;
            width: calc(100% - 250px);
            padding: 2rem;
        }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }

        .dashboard-header h1 {
            color: var(--primary-color);
            font-size: 1.8rem;
        }

        .profile-summary {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .profile-avatar {
            width: 60px;
            height: 60px;
            border-radius: 50%;
        }

        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            margin-top: 2rem;
        }

        .card {
            background: var(--card-bg);
            border-radius: 16px;
            padding: 1.5rem;
            text-align: center;
            box-shadow: var(--shadow);
            transition: transform 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card i {
            font-size: 2rem;
            color: var(--primary-color);
            margin-bottom: 0.5rem;
        }

        @media (max-width: 992px) {
            .sidebar { display: none; }
            .main-content { margin-left: 0; width: 100%; }
        }
    </style>
</head>

<body>

<!-- ===== SIDEBAR ===== -->
<aside class="sidebar">
    <div class="sidebar-header">
        <img src="${pageContext.request.contextPath}/images/FD.jpeg" alt="Logo" class="sidebar-logo">
        <h2>Future Developers</h2>
    </div>

    <ul class="sidebar-menu">
        <li class="active"><a href="dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="profile.jsp"><i class="fas fa-user"></i> Profile</a></li>
        <li><a href="courses.jsp"><i class="fas fa-book"></i> Courses</a></li>
        <li><a href="lectures.jsp"><i class="fas fa-video"></i> Lectures</a></li>
        <li><a href="attendance.jsp"><i class="fas fa-check-circle"></i> Attendance</a></li>
        <li><a href="notes.jsp"><i class="fas fa-file-alt"></i> Notes</a></li>
        <li><a href="tests.jsp"><i class="fas fa-pen"></i> Tests</a></li>
        <li><a href="progress.jsp"><i class="fas fa-chart-line"></i> Progress</a></li>
    </ul>

    <div class="sidebar-footer">
        <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
            <button type="submit" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</button>
        </form>
    </div>
</aside>

<!-- ===== MAIN CONTENT ===== -->
<main class="main-content">
    <header class="dashboard-header">
        <h1>Welcome, <span><%= user.getFullName() %></span></h1>
        <div class="profile-summary">
            <img src="${pageContext.request.contextPath}/images/student-avatar.png" alt="Student" class="profile-avatar">
            <div>
                <p><strong>ID:</strong> <%= user.getUserId() %></p>
                <p><strong>Email:</strong> <%= user.getEmail() %></p>
                <p><strong>Role:</strong> <%= user.getRole() %></p>
            </div>
        </div>
    </header>

    <section class="dashboard-cards">
        <div class="card"><i class="fas fa-book"></i><h3>3</h3><p>Enrolled Courses</p></div>
        <div class="card"><i class="fas fa-play-circle"></i><h3>12</h3><p>Completed Lectures</p></div>
        <div class="card"><i class="fas fa-chart-pie"></i><h3>92%</h3><p>Attendance</p></div>
        <div class="card"><i class="fas fa-calendar-check"></i><h3>2</h3><p>Upcoming Tests</p></div>
    </section>
</main>

<script>
    document.querySelectorAll('.sidebar-menu li').forEach(item => {
        item.addEventListener('click', () => {
            document.querySelectorAll('.sidebar-menu li').forEach(i => i.classList.remove('active'));
            item.classList.add('active');
        });
    });
</script>
</body>
</html>
