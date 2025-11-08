<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.example.future_developers_lms.model.Course" %>
<%
    // Simulate data (replace with CourseService / DAO integration)
    List<Course> enrolledCourses = (List<Course>) request.getAttribute("enrolledCourses");
    if (enrolledCourses == null) {
        enrolledCourses = new ArrayList<>();
//        enrolledCourses.add(new Course("Java Full Stack Development", "Mr. Smith", "In Progress"));
//        enrolledCourses.add(new Course("Python for Beginners", "Ms. Johnson", "Completed"));
//        enrolledCourses.add(new Course("Frontend Development (HTML/CSS/JS)", "Mr. Brown", "In Progress"));
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Courses | Future Developers LMS</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a2c1234567.js" crossorigin="anonymous"></script>

    <style>
        /* ===== BASE STYLING ===== */
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Poppins', sans-serif; }
        body { display: flex; min-height: 100vh; background: #f5f6fa; color: #333; }

        /* ===== SIDEBAR ===== */
        .sidebar {
            width: 260px;
            background: linear-gradient(180deg, #1e3c72 0%, #2a5298 100%);
            color: #fff;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            position: fixed;
            height: 100%;
            padding-top: 20px;
            transition: width 0.3s;
        }

        .sidebar-header {
            text-align: center;
            padding: 10px 0;
        }

        .sidebar-logo {
            width: 65px;
            border-radius: 50%;
            margin-bottom: 10px;
        }

        .sidebar h2 {
            font-size: 18px;
            letter-spacing: 0.5px;
            color: #fff;
        }

        .sidebar-menu {
            list-style: none;
            padding: 20px 0;
        }

        .sidebar-menu li { margin: 8px 0; }

        .sidebar-menu a {
            text-decoration: none;
            color: #dcdde1;
            display: flex;
            align-items: center;
            padding: 10px 25px;
            transition: all 0.3s;
            font-weight: 500;
        }

        .sidebar-menu a i {
            margin-right: 12px;
            font-size: 16px;
        }

        .sidebar-menu a:hover,
        .sidebar-menu .active a {
            background: rgba(255, 255, 255, 0.15);
            color: #fff;
            border-left: 4px solid #00bcd4;
        }

        .sidebar-footer {
            text-align: center;
            padding: 15px;
            border-top: 1px solid rgba(255, 255, 255, 0.2);
        }

        .logout-btn {
            background: #e74c3c;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            cursor: pointer;
            font-weight: 500;
            transition: background 0.3s;
        }

        .logout-btn:hover {
            background: #c0392b;
        }

        /* ===== MAIN CONTENT ===== */
        .main-content {
            margin-left: 260px;
            flex: 1;
            padding: 30px 40px;
        }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .dashboard-header h1 {
            font-size: 26px;
            font-weight: 600;
            color: #1e3c72;
        }

        .btn-primary {
            background: #00bcd4;
            border: none;
            color: #fff;
            padding: 10px 20px;
            border-radius: 25px;
            cursor: pointer;
            font-weight: 500;
            transition: background 0.3s;
        }

        .btn-primary:hover {
            background: #0192a2;
        }

        /* ===== COURSES ===== */
        .courses-section h2 {
            font-size: 20px;
            margin-bottom: 20px;
            color: #2a5298;
        }

        .courses-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
        }

        .course-card {
            background: #fff;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }

        .course-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 8px 14px rgba(0,0,0,0.15);
        }

        .course-card h3 {
            font-size: 18px;
            margin-bottom: 10px;
            color: #1e3c72;
        }

        .course-card p {
            font-size: 14px;
            margin: 5px 0;
            color: #555;
        }

        .btn-secondary {
            background: #2a5298;
            color: #fff;
            border: none;
            padding: 8px 16px;
            border-radius: 20px;
            cursor: pointer;
            margin-top: 10px;
            transition: background 0.3s;
        }

        .btn-secondary:hover {
            background: #00bcd4;
        }

        /* ===== RESPONSIVE ===== */
        @media(max-width: 768px) {
            .sidebar { width: 200px; }
            .main-content { margin-left: 200px; padding: 25px; }
        }

        @media(max-width: 600px) {
            .sidebar { display: none; }
            .main-content { margin: 0; padding: 20px; }
        }
    </style>
</head>

<body>

<!-- ===== SIDEBAR ===== -->
<aside class="sidebar">
    <div class="sidebar-header">
        <img src="../images/FD.jpeg" alt="Logo" class="sidebar-logo">
        <h2>Future Developers</h2>
    </div>
    <ul class="sidebar-menu">
        <li><a href="<%= request.getContextPath() %>/DashboardServlet"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="<%= request.getContextPath() %>/ProfileServlet"><i class="fas fa-user"></i> Profile</a></li>
        <li class="active"><a href="<%= request.getContextPath() %>/CourseServlet?action=enrolled"><i class="fas fa-book"></i> Courses</a></li>
        <li><a href="<%= request.getContextPath() %>/LectureServlet"><i class="fas fa-video"></i> Lectures</a></li>
        <li><a href="<%= request.getContextPath() %>/AttendanceServlet"><i class="fas fa-check-circle"></i> Attendance</a></li>
        <li><a href="<%= request.getContextPath() %>/NotesServlet"><i class="fas fa-file-alt"></i> Notes</a></li>
        <li><a href="<%= request.getContextPath() %>/TestServlet"><i class="fas fa-pen"></i> Tests</a></li>
        <li><a href="<%= request.getContextPath() %>/PaymentServlet"><i class="fas fa-wallet"></i> Payments</a></li>
        <li><a href="<%= request.getContextPath() %>/ProgressServlet"><i class="fas fa-chart-line"></i> Progress</a></li>
        <li><a href="<%= request.getContextPath() %>/FeedbackServlet"><i class="fas fa-comment-dots"></i> Feedback</a></li>
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
        <h1>My Courses</h1>
        <form action="<%= request.getContextPath() %>/CourseServlet" method="get">
            <input type="hidden" name="action" value="all">
            <button class="btn-primary" type="submit">Enroll in New Course</button>
        </form>
    </header>

    <section class="courses-section">
        <h2>Enrolled Courses</h2>
        <div class="courses-grid">
            <% for (Course c : enrolledCourses) { %>
<%--            <div class="course-card">--%>
<%--                <h3><%= c.getCourseName()%></h3>--%>
<%--                <p><strong>Instructor:</strong> <%= c.getInstructor() %></p>--%>
<%--                <p><strong>Status:</strong> <%= c.getStatus() %></p>--%>
<%--                <form action="<%= request.getContextPath() %>/CourseServlet" method="post">--%>
<%--                    <input type="hidden" name="action" value="unenroll">--%>
<%--                    <input type="hidden" name="courseName" value="<%= c.getCourseName() %>">--%>
<%--                    <button class="btn-secondary" type="submit">Unenroll</button>--%>
<%--                </form>--%>
<%--            </div>--%>
            <% } %>
        </div>
    </section>
</main>

</body>
</html>
