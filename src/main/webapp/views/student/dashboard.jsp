<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.example.future_developers_lms.model.User" %>

<%
    // ===== Validate Session =====
    HttpSession sessionUser = request.getSession(false);
    User student = null;
    if (sessionUser == null || (student = (User) sessionUser.getAttribute("user")) == null) {
        response.sendRedirect(request.getContextPath() + "/views/auth/login.jsp");
        return;
    }

    // ===== Dummy dashboard data (replace with Service layer later) =====
    int enrolledCourses = (request.getAttribute("enrolledCount") != null)
            ? (Integer) request.getAttribute("enrolledCount") : 3;
    int attendancePercent = (request.getAttribute("attendancePercent") != null)
            ? (Integer) request.getAttribute("attendancePercent") : 86;
    int totalTests = (request.getAttribute("totalTests") != null)
            ? (Integer) request.getAttribute("totalTests") : 5;
    int totalNotes = (request.getAttribute("totalNotes") != null)
            ? (Integer) request.getAttribute("totalNotes") : 8;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | Future Developers LMS</title>

    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a2c1234567.js" crossorigin="anonymous"></script>

    <style>
        :root {
            --primary: #1e90a1;
            --bg-main: #f9fbfd;
            --text-dark: #1f2937;
            --text-light: #fff;
        }
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Poppins', sans-serif; }
        body { display: flex; background: var(--bg-main); color: var(--text-dark); }

        /* ===== SIDEBAR ===== */
        .sidebar {
            width: 250px;
            background: var(--primary);
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
            border-radius: 10px;
            margin-bottom: 8px;
        }
        .sidebar-menu {
            list-style: none;
            padding: 1rem;
        }
        .sidebar-menu li { margin-bottom: 8px; }
        .sidebar-menu a {
            text-decoration: none;
            color: white;
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 10px 20px;
            border-radius: 8px;
            transition: 0.3s;
        }
        .sidebar-menu a:hover,
        .sidebar-menu li.active a { background: rgba(255,255,255,0.2); }

        .logout-btn {
            background: #111;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            margin: 15px auto;
            cursor: pointer;
        }

        /* ===== MAIN CONTENT ===== */
        .main-content {
            margin-left: 250px;
            padding: 2rem;
            width: calc(100% - 250px);
        }
        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }
        .dashboard-header h1 {
            color: var(--primary);
            font-size: 1.8rem;
            font-weight: 600;
        }
        .welcome { color: #444; font-size: 1rem; }

        /* ===== CARDS ===== */
        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(230px, 1fr));
            gap: 1.5rem;
        }
        .card {
            background: white;
            border-radius: 16px;
            padding: 1.5rem;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            display: flex;
            align-items: center;
            gap: 1rem;
            transition: transform 0.3s;
        }
        .card:hover { transform: translateY(-5px); }
        .card-icon {
            background: var(--primary);
            color: white;
            font-size: 1.5rem;
            padding: 15px;
            border-radius: 50%;
        }
        .card h3 { margin-bottom: 5px; font-size: 1.2rem; color: #333; }
        .card p { color: #666; font-size: 0.9rem; }

        /* ===== SECTIONS ===== */
        .section {
            margin-top: 2.5rem;
            background: #fff;
            padding: 1.5rem;
            border-radius: 16px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }
        .section h2 {
            color: var(--primary);
            font-size: 1.3rem;
            margin-bottom: 1rem;
        }
        .list-item {
            display: flex;
            justify-content: space-between;
            border-bottom: 1px solid #eee;
            padding: 10px 0;
        }
        .list-item:last-child { border-bottom: none; }

        @media(max-width: 992px) {
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
        <p style="font-size: 14px;">Welcome, <%= student.getFullName() %></p>
    </div>

    <ul class="sidebar-menu">
        <li class="active"><a href="${pageContext.request.contextPath}/views/student/dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="${pageContext.request.contextPath}/views/student/profile.jsp"><i class="fas fa-user"></i> Profile</a></li>
        <li><a href="${pageContext.request.contextPath}/CourseServlet?action=all"><i class="fas fa-book"></i> Apply For Courses</a></li>
        <li><a href="${pageContext.request.contextPath}/CourseServlet?action=enrolled"><i class="fas fa-list"></i> Enrolled Courses</a></li>
        <li><a href="${pageContext.request.contextPath}/LectureServlet"><i class="fas fa-video"></i> Lectures</a></li>
        <li><a href="${pageContext.request.contextPath}/AttendanceServlet"><i class="fas fa-check-circle"></i> Attendance</a></li>
        <li><a href="${pageContext.request.contextPath}/NotesServlet"><i class="fas fa-file-alt"></i> Notes</a></li>
        <li><a href="${pageContext.request.contextPath}/TestServlet"><i class="fas fa-pen"></i> Tests</a></li>
        <li><a href="${pageContext.request.contextPath}/PaymentServlet"><i class="fas fa-wallet"></i> Payments</a></li>
        <li><a href="${pageContext.request.contextPath}/ProgressServlet"><i class="fas fa-chart-line"></i> Progress</a></li>
        <li><a href="${pageContext.request.contextPath}/FeedbackServlet"><i class="fas fa-comment-dots"></i> Feedback</a></li>
    </ul>

    <div class="sidebar-footer text-center">
        <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
            <button type="submit" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</button>
        </form>
    </div>
</aside>

<!-- ===== MAIN CONTENT ===== -->
<main class="main-content">
    <div class="dashboard-header">
        <h1>🎓 Student Dashboard</h1>
        <p class="welcome">Hello, <strong><%= student.getFullName() %></strong> 👋</p>
    </div>

    <!-- ===== DASHBOARD CARDS ===== -->
    <section class="cards">
        <div class="card">
            <div class="card-icon"><i class="fas fa-book"></i></div>
            <div>
                <h3><%= enrolledCourses %></h3>
                <p>Enrolled Courses</p>
            </div>
        </div>
        <div class="card">
            <div class="card-icon"><i class="fas fa-check-circle"></i></div>
            <div>
                <h3><%= attendancePercent %>%</h3>
                <p>Attendance</p>
            </div>
        </div>
        <div class="card">
            <div class="card-icon"><i class="fas fa-pen"></i></div>
            <div>
                <h3><%= totalTests %></h3>
                <p>Total Tests</p>
            </div>
        </div>
        <div class="card">
            <div class="card-icon"><i class="fas fa-file-alt"></i></div>
            <div>
                <h3><%= totalNotes %></h3>
                <p>Study Notes</p>
            </div>
        </div>
    </section>

    <!-- ===== RECENT LECTURES ===== -->
    <section class="section">
        <h2>Recent Lectures</h2>
        <div class="list-item"><span>Core Java OOPs – Lecture 12</span><span>📅 05 Nov 2025</span></div>
        <div class="list-item"><span>Spring Boot REST API</span><span>📅 04 Nov 2025</span></div>
        <div class="list-item"><span>Frontend Project UI</span><span>📅 02 Nov 2025</span></div>
    </section>

    <!-- ===== UPCOMING TESTS ===== -->
    <section class="section">
        <h2>Upcoming Tests</h2>
        <div class="list-item"><span>Java Exception Handling</span><span>🕒 10 Nov 2025</span></div>
        <div class="list-item"><span>MySQL & JDBC</span><span>🕒 13 Nov 2025</span></div>
    </section>
</main>

</body>
</html>
