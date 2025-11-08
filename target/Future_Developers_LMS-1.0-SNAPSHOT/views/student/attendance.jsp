<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, org.example.future_developers_lms.model.Attendance, org.example.future_developers_lms.model.User" %>

<%
    // ===== SESSION VALIDATION =====
    HttpSession sessionUser = request.getSession(false);
    User user = null;
    if (sessionUser == null || (user = (User) sessionUser.getAttribute("user")) == null) {
        response.sendRedirect(request.getContextPath() + "/views/auth/login.jsp");
        return;
    }

    // ===== FETCH ATTENDANCE FOR THIS STUDENT =====
    List<Attendance> attendanceList = (List<Attendance>) request.getAttribute("attendanceList");
    if (attendanceList == null) attendanceList = new ArrayList<>();

    // ===== CALCULATE OVERALL PERCENTAGE =====
    int totalLectures = attendanceList.size();
    int attended = 0;
    for (Attendance a : attendanceList) {
        if ("PRESENT".equalsIgnoreCase(a.getStatus())) attended++;
    }
    int overallPercent = totalLectures > 0 ? (int) ((attended * 100.0) / totalLectures) : 0;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Attendance | Future Developers LMS</title>

    <!-- Bootstrap & Fonts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a2c1234567.js" crossorigin="anonymous"></script>

    <style>
        :root {
            --primary: #1e90a1;
            --sidebar-bg: #1e90a1;
            --main-bg: #f9fbfd;
        }
        body {
            display: flex;
            font-family: 'Poppins', sans-serif;
            background: var(--main-bg);
            margin: 0;
        }

        /* ===== SIDEBAR ===== */
        .sidebar {
            width: 250px;
            background: var(--sidebar-bg);
            color: #fff;
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
        .sidebar-menu { list-style: none; padding: 1rem; }
        .sidebar-menu li { margin-bottom: 5px; }
        .sidebar-menu a {
            text-decoration: none;
            color: white;
            padding: 10px 20px;
            display: block;
            border-radius: 8px;
        }
        .sidebar-menu li.active a,
        .sidebar-menu a:hover {
            background: rgba(255, 255, 255, 0.2);
        }
        .logout-btn {
            background: #111;
            color: white;
            border: none;
            border-radius: 25px;
            padding: 10px 20px;
            cursor: pointer;
        }
        .main-content {
            margin-left: 250px;
            padding: 2rem;
            width: calc(100% - 250px);
        }

        /* ===== ATTENDANCE ===== */
        .progress-circle {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            background: conic-gradient(var(--primary) 0% <%= overallPercent %>%, #e0e0e0 <%= overallPercent %>% 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            margin: 1rem auto;
        }

        .progress-circle span {
            position: absolute;
            font-size: 1.6rem;
            font-weight: 600;
            color: #333;
        }

        .attendance-table {
            margin-top: 2rem;
            background: #fff;
            border-radius: 10px;
            padding: 1rem;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }

        th {
            background: var(--primary);
            color: white;
        }
        .status-present {
            color: green;
            font-weight: 600;
        }
        .status-absent {
            color: red;
            font-weight: 600;
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
        <img src="../images/FD.jpeg" alt="Logo" class="sidebar-logo">
        <h2>Future Developers</h2>
        <p style="font-size: 14px;">Welcome, <%= user.getFullName() %></p>
    </div>
    <ul class="sidebar-menu">
        <li><a href="dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="profile.jsp"><i class="fas fa-user"></i> Profile</a></li>
        <li><a href="enrolledCourses.jsp"><i class="fas fa-book"></i> Courses</a></li>
        <li><a href="lectures.jsp"><i class="fas fa-video"></i> Lectures</a></li>
        <li class="active"><a href="attendance.jsp"><i class="fas fa-check-circle"></i> Attendance</a></li>
        <li><a href="notes.jsp"><i class="fas fa-file-alt"></i> Notes</a></li>
        <li><a href="tests.jsp"><i class="fas fa-pen"></i> Tests</a></li>
        <li><a href="payments.jsp"><i class="fas fa-wallet"></i> Payments</a></li>
        <li><a href="progress.jsp"><i class="fas fa-chart-line"></i> Progress</a></li>
        <li><a href="feedback.jsp"><i class="fas fa-comment-dots"></i> Feedback</a></li>
    </ul>
    <div class="sidebar-footer text-center">
        <form action="<%= request.getContextPath() %>/LogoutServlet" method="post">
            <button type="submit" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</button>
        </form>
    </div>
</aside>

<!-- ===== MAIN CONTENT ===== -->
<main class="main-content">
    <header class="text-center mb-5">
        <h1 style="color: var(--primary);">Attendance Overview</h1>
        <div class="progress-circle">
            <span><%= overallPercent %>%</span>
        </div>
        <p class="text-muted">Overall attendance for <strong><%= user.getFullName() %></strong></p>
    </header>

    <!-- Attendance Table -->
    <section class="attendance-table">
        <h4 class="mb-3 text-primary">Detailed Attendance</h4>
        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>Course Name</th>
                <th>Lecture Date</th>
                <th>Status</th>
                <th>Remarks</th>
            </tr>
            </thead>
            <tbody>
            <% if (attendanceList.isEmpty()) { %>
            <tr><td colspan="4" class="text-center text-muted">No attendance records found.</td></tr>
            <% } else {
                for (Attendance a : attendanceList) { %>
            <tr>
                <td><%= a.getCourseName() %></td>
                <td><%= a.getLectureDate() %></td>
                <td class="<%= a.getStatus().equalsIgnoreCase("PRESENT") ? "status-present" : "status-absent" %>">
                    <%= a.getStatus() %>
                </td>
                <td><%= a.getRemarks() != null ? a.getRemarks() : "-" %></td>
            </tr>
            <% } } %>
            </tbody>
        </table>
    </section>
</main>
</body>
</html>
