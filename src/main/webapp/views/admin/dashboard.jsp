<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard | Future Developers LMS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Poppins', sans-serif; }

        body {
            display: flex;
            background-color: #f5f7fb;
            color: #333;
        }

        /* ===== SIDEBAR ===== */
        .sidebar {
            width: 250px;
            background: #0d47a1;
            color: #fff;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            position: fixed;
        }

        .sidebar-header {
            text-align: center;
            padding: 20px;
            border-bottom: 1px solid rgba(255,255,255,0.2);
        }

        .sidebar-header img {
            width: 60px;
            border-radius: 50%;
            margin-bottom: 10px;
        }

        .sidebar-header h2 {
            font-size: 1.2rem;
        }

        .sidebar-menu {
            list-style: none;
            padding: 20px 0;
        }

        .sidebar-menu li {
            padding: 12px 20px;
        }

        .sidebar-menu li a {
            text-decoration: none;
            color: #cfd8dc;
            display: flex;
            align-items: center;
            font-size: 0.95rem;
            transition: 0.3s;
        }

        .sidebar-menu li a i {
            margin-right: 10px;
        }

        .sidebar-menu li.active, .sidebar-menu li:hover {
            background-color: #1565c0;
        }

        .sidebar-footer {
            text-align: center;
            padding: 15px;
            border-top: 1px solid rgba(255,255,255,0.2);
        }

        .logout-btn {
            background-color: #e53935;
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
            transition: 0.3s;
        }

        .logout-btn:hover {
            background-color: #c62828;
        }

        /* ===== MAIN CONTENT ===== */
        .main-content {
            margin-left: 250px;
            padding: 30px;
            width: calc(100% - 250px);
        }

        .dashboard-header {
            background: white;
            padding: 20px;
            border-radius: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            margin-bottom: 25px;
        }

        .dashboard-header h1 {
            color: #0d47a1;
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

        .profile-summary div p {
            font-size: 0.9rem;
            color: #444;
        }

        /* ===== DASHBOARD CARDS ===== */
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 20px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .card:hover { transform: translateY(-5px); }

        .card i {
            font-size: 28px;
            color: #0d47a1;
            margin-bottom: 10px;
        }

        .card h3 {
            font-size: 1.6rem;
            color: #333;
        }

        .card p {
            color: #666;
            font-size: 0.9rem;
        }

        /* ===== RECENT ACTIVITY ===== */
        .recent-section {
            margin-top: 40px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        .recent-section h2 {
            color: #0d47a1;
            margin-bottom: 15px;
        }

        .activity-list li {
            list-style: none;
            padding: 10px 0;
            border-bottom: 1px solid #eee;
        }

        .activity-list li:last-child {
            border-bottom: none;
        }

        /* ===== RESPONSIVE ===== */
        @media(max-width: 768px) {
            .sidebar { display: none; }
            .main-content { margin-left: 0; width: 100%; }
        }
    </style>
</head>

<body>
<!-- ===== SIDEBAR ===== -->
<aside class="sidebar">
    <div class="sidebar-header">
        <img src="../images/FD.jpeg" alt="Logo">
        <h2>Admin Panel</h2>
    </div>

    <ul class="sidebar-menu">
        <li class="active"><a href="#"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="manage-students.jsp"><i class="fas fa-user-graduate"></i> Students</a></li>
        <li><a href="manage-teachers.jsp"><i class="fas fa-chalkboard-teacher"></i> Teachers</a></li>
        <li><a href="manage-courses.jsp"><i class="fas fa-book"></i> Courses</a></li>
        <li><a href="manage-tests.jsp"><i class="fas fa-pen"></i> Tests</a></li>
        <li><a href="manage-lectures.jsp"><i class="fas fa-video"></i> Lectures</a></li>
        <li><a href="manage-notes.jsp"><i class="fas fa-file-alt"></i> Notes</a></li>
        <li><a href="reports.jsp"><i class="fas fa-chart-line"></i> Reports</a></li>
        <li><a href="admin-profile.jsp"><i class="fas fa-user-cog"></i> Profile</a></li>
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
        <h1>Welcome, <span>${admin.name}</span> 👋</h1>
        <div class="profile-summary">
            <img src="../images/admin.png" alt="Admin">
            <div>
                <p><strong>ID:</strong> ${admin.adminId}</p>
                <p><strong>Email:</strong> ${admin.email}</p>
            </div>
        </div>
    </header>

    <!-- ===== DASHBOARD CARDS ===== -->
    <section class="dashboard-cards">
        <div class="card">
            <i class="fas fa-user-graduate"></i>
            <h3>${admin.totalStudents}</h3>
            <p>Total Students</p>
        </div>
        <div class="card">
            <i class="fas fa-chalkboard-teacher"></i>
            <h3>${admin.totalTeachers}</h3>
            <p>Total Teachers</p>
        </div>
        <div class="card">
            <i class="fas fa-book-open"></i>
            <h3>${admin.totalCourses}</h3>
            <p>Active Courses</p>
        </div>
        <div class="card">
            <i class="fas fa-video"></i>
            <h3>${admin.totalLectures}</h3>
            <p>Lectures Uploaded</p>
        </div>
        <div class="card">
            <i class="fas fa-pen"></i>
            <h3>${admin.totalTests}</h3>
            <p>Tests Created</p>
        </div>
    </section>

    <!-- ===== RECENT ACTIVITY ===== -->
    <section class="recent-section">
        <h2>Recent Activities</h2>
        <ul class="activity-list">
            <c:forEach var="activity" items="${recentActivities}">
                <li><strong>${activity.title}</strong> — ${activity.date}</li>
            </c:forEach>
        </ul>
    </section>

    <!-- ===== SYSTEM REPORT ===== -->
    <section class="recent-section">
        <h2>System Overview</h2>
        <ul class="activity-list">
            <li><strong>Last Backup:</strong> ${admin.lastBackup}</li>
            <li><strong>Active Users:</strong> ${admin.activeUsers}</li>
            <li><strong>Pending Approvals:</strong> ${admin.pendingRequests}</li>
        </ul>
    </section>
</main>

<script src="https://kit.fontawesome.com/a2c1234567.js" crossorigin="anonymous"></script>
</body>
</html>
