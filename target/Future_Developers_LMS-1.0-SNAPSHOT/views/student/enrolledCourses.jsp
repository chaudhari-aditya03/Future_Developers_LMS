<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, org.example.future_developers_lms.model.Course, org.example.future_developers_lms.model.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<%
    // ---- SESSION VALIDATION ----
    User user = (User) session.getAttribute("user");
    if (user == null || !"STUDENT".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect(request.getContextPath() + "/views/auth/login.jsp");
        return;
    }

    List<Course> enrolledCourses = (List<Course>) request.getAttribute("enrolledCourses");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Courses | Future Developers LMS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap & Fonts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a2c1234567.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary-color: #1e90a1;
            --sidebar-bg: #1e90a1;
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
            background: #fff;
            padding: 15px 25px;
            border-radius: 10px;
            box-shadow: var(--shadow);
        }

        .dashboard-header h1 {
            color: var(--primary-color);
            font-size: 1.8rem;
        }

        .btn-primary {
            background: var(--primary-color);
            border: none;
            border-radius: 25px;
            padding: 10px 20px;
            color: white;
            font-weight: 500;
        }

        .btn-primary:hover {
            background: #157e8f;
        }

        /* ===== COURSE CARDS ===== */
        .courses-grid {
            margin-top: 2rem;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 1.5rem;
        }

        .course-card {
            background: var(--card-bg);
            border-radius: 12px;
            box-shadow: var(--shadow);
            padding: 20px;
            border-left: 5px solid var(--primary-color);
            transition: transform 0.3s;
        }

        .course-card:hover {
            transform: translateY(-5px);
        }

        .course-card h3 {
            font-size: 18px;
            color: var(--primary-color);
        }

        .course-card p {
            margin: 4px 0;
            font-size: 14px;
        }

        .btn-secondary {
            background: var(--primary-color);
            color: #fff;
            border: none;
            padding: 6px 12px;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 8px;
        }

        .btn-secondary:hover {
            background: #147382;
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
        <p style="font-size: 14px;">Welcome, <%= user.getFullName() %></p>
    </div>

    <ul class="sidebar-menu">
        <li><a href="dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="profile.jsp"><i class="fas fa-user"></i> Profile</a></li>
        <li class="active"><a href="courses.jsp"><i class="fas fa-book"></i> Courses</a></li>
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
        <h1>My Courses</h1>
        <form action="${pageContext.request.contextPath}/CourseServlet" method="get">
            <input type="hidden" name="action" value="all">
            <button class="btn-primary" type="submit">Enroll in New Course</button>
        </form>
    </header>

    <section class="courses-grid">
        <c:choose>
            <c:when test="${not empty enrolledCourses}">
                <c:forEach var="course" items="${enrolledCourses}">
                    <div class="course-card">
                        <h3>${course.courseName}</h3>
                        <p><strong>Instructor:</strong> ${course.instructor}</p>
                        <p><strong>Status:</strong> ${course.status}</p>
                        <form action="${pageContext.request.contextPath}/CourseServlet" method="post">
                            <input type="hidden" name="action" value="unenroll">
                            <input type="hidden" name="courseId" value="${course.courseId}">
                            <button class="btn-secondary" type="submit">Unenroll</button>
                        </form>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p>No enrolled courses found.</p>
            </c:otherwise>
        </c:choose>
    </section>
</main>

</body>
</html>
