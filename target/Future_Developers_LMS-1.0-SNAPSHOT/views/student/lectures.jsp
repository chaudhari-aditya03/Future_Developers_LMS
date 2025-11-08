<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, org.example.future_developers_lms.model.Lecture" %>
<%
    // Fetch session details
    HttpSession userSession = request.getSession(false); // false => don't create new
    String username = null;
    if (userSession != null) {
        username = (String) userSession.getAttribute("username");
    }

    // Redirect if no active session (not logged in or bypassed login)
    if (username == null) {
        response.sendRedirect("../views/auth/login.jsp");
        return;
    }

    // Get lectures list (set by LectureServlet)
    List<Lecture> lectures = (List<Lecture>) request.getAttribute("lectures");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Lectures | Future Developers LMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a2c1234567.js" crossorigin="anonymous"></script>

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f7f9fb;
            display: flex;
            margin: 0;
        }

        /* Sidebar */
        .sidebar {
            width: 240px;
            background: linear-gradient(180deg, #003566, #0074e4);
            color: white;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 20px 0;
        }

        .sidebar-header {
            text-align: center;
        }

        .sidebar-header img {
            border-radius: 50%;
            width: 70px;
            height: 70px;
        }

        .sidebar h2 {
            font-size: 18px;
            color: #fff;
            margin-top: 10px;
        }

        .sidebar-menu {
            list-style: none;
            padding: 0;
            margin: 30px 0;
        }

        .sidebar-menu a {
            display: block;
            color: white;
            text-decoration: none;
            padding: 12px 25px;
            transition: 0.3s;
        }

        .sidebar-menu a:hover,
        .sidebar-menu .active {
            background: rgba(255, 255, 255, 0.2);
            border-left: 4px solid #ffcb05;
            color: #ffcb05;
        }

        .logout-btn {
            background-color: #ffcb05;
            color: #000;
            border: none;
            padding: 10px;
            border-radius: 20px;
            width: 80%;
            margin: 10px auto;
            cursor: pointer;
            font-weight: 500;
        }

        .logout-btn:hover {
            background-color: #ffc107;
        }

        /* Main */
        .main-content {
            margin-left: 240px;
            padding: 30px;
            width: calc(100% - 240px);
        }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #fff;
            padding: 15px 25px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .dashboard-header h1 {
            font-size: 22px;
            font-weight: 600;
            color: #004aad;
        }

        select {
            border-radius: 6px;
            padding: 6px 10px;
            border: 1px solid #ccc;
        }

        .lectures-grid {
            margin-top: 25px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 20px;
        }

        .lecture-card {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 20px;
            border-left: 5px solid #0074e4;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .lecture-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
        }

        .lecture-card h3 {
            color: #004aad;
            font-size: 18px;
            font-weight: 600;
        }

        .lecture-card p {
            font-size: 14px;
            margin: 5px 0;
        }

        .btn-primary {
            background: linear-gradient(90deg, #004aad, #0074e4);
            border: none;
            padding: 6px 14px;
            border-radius: 6px;
            font-weight: 500;
        }
    </style>
</head>

<body>
<!-- Sidebar -->
<aside class="sidebar">
    <div class="sidebar-header">
        <img src="../images/FD.jpeg" alt="Logo">
        <h2>Future Developers</h2>
        <p style="font-size: 14px;">Welcome, <%= username %></p>
    </div>

    <ul class="sidebar-menu">
        <li><a href="dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="profile.jsp"><i class="fas fa-user"></i> Profile</a></li>
        <li><a href="enrolledCourses.jsp"><i class="fas fa-book"></i> Courses</a></li>
        <li class="active"><a href="lectures.jsp"><i class="fas fa-video"></i> Lectures</a></li>
        <li><a href="attendance.jsp"><i class="fas fa-check-circle"></i> Attendance</a></li>
        <li><a href="notes.jsp"><i class="fas fa-file-alt"></i> Notes</a></li>
        <li><a href="tests.jsp"><i class="fas fa-pen"></i> Tests</a></li>
        <li><a href="payments.jsp"><i class="fas fa-wallet"></i> Payments</a></li>
        <li><a href="progress.jsp"><i class="fas fa-chart-line"></i> Progress</a></li>
    </ul>

    <div class="text-center">
        <form action="../LogoutServlet" method="post">
            <button class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</button>
        </form>
    </div>
</aside>

<!-- Main Content -->
<main class="main-content">
    <div class="dashboard-header">
        <h1>Lecture Summary</h1>
        <form method="get" action="../LectureServlet">
            <select name="type" onchange="this.form.submit()">
                <option value="all">All</option>
                <option value="live">Live</option>
                <option value="recorded">Recorded</option>
            </select>
        </form>
    </div>

    <section class="lectures-grid">
<%--        <%--%>
<%--            if (lectures != null && !lectures.isEmpty()) {--%>
<%--                for (Lecture lec : lectures) {--%>
<%--        %>--%>
<%--        <div class="lecture-card">--%>
<%--            <h3><%= lec.getTitle() %></h3>--%>
<%--            <p><strong>Instructor:</strong> <%= lec.getInstructor() %></p>--%>
<%--            <p><strong>Course:</strong> <%= lec.getCourseName() %></p>--%>
<%--            <p><strong>Date:</strong> <%= lec.getDate() %> | <strong>Time:</strong> <%= lec.getTime() %></p>--%>

<%--            <% if ("live".equalsIgnoreCase(lec.getType())) { %>--%>
<%--            <a href="<%= lec.getLink() %>" class="btn btn-primary">Join Live</a>--%>
<%--            <% } else { %>--%>
<%--            <a href="<%= lec.getLink() %>" class="btn btn-primary">Watch Recorded</a>--%>
<%--            <% } %>--%>
<%--        </div>--%>
<%--        <%--%>
<%--            }--%>
<%--        } else {--%>
<%--        %>--%>
<%--        <p>No lectures available.</p>--%>
<%--        <%--%>
<%--            }--%>
<%--        %>--%>
    </section>
</main>
</body>
</html>
