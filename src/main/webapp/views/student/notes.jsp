<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,org.example.future_developers_lms.model.Note" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Notes | Future Developers LMS</title>

    <!-- CSS LINKS -->
    <link rel="stylesheet" href="../assets/css/dashboard.css">
    <link rel="stylesheet" href="../assets/css/style.css">

    <!-- FONTS & ICONS -->
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
        <li><a href="profile.jsp"><i class="fas fa-user"></i> Profile</a></li>
        <li><a href="enrolledCourses.jsp"><i class="fas fa-book"></i> Courses</a></li>
        <li><a href="lectures.jsp"><i class="fas fa-video"></i> Lectures</a></li>
        <li><a href="attendance.jsp"><i class="fas fa-check-circle"></i> Attendance</a></li>
        <li class="active"><a href="notes.jsp"><i class="fas fa-file-alt"></i> Notes</a></li>
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
        <h1>📚 Study Materials / Notes</h1>
        <div class="search-bar">
            <input type="text" id="noteSearch" placeholder="Search by course or topic...">
            <button id="searchBtn"><i class="fas fa-search"></i></button>
        </div>
    </header>

    <section class="notes-section">
        <h2>Available Notes</h2>
        <table class="notes-table">
            <thead>
            <tr>
                <th>Course</th>
                <th>Topic / File Name</th>
                <th>Uploaded On</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody id="notesList">
            <%
                List<Note> notesList = (List<Note>) request.getAttribute("notesList");
                if (notesList != null && !notesList.isEmpty()) {
                    for (Note note : notesList) {
            %>
            <tr>
                <td><%= note.getCourseName() %></td>
                <td><%= note.getFileName() %></td>
                <td><%= note.getUploadedDate() %></td>
                <td>
                    <a href="<%=request.getContextPath()%>/DownloadNoteServlet?noteId=<%=note.getId()%>"
                       class="btn-primary"><i class="fas fa-download"></i> Download</a>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="4" style="text-align:center;">No notes available.</td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </section>
</main>

<!-- ===== JS ===== -->
<script src="../student/js/dashboard.js"></script>
<script src="../student/js/notes.js"></script>

</body>
</html>
