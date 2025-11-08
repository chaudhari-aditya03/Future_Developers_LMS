<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.example.future_developers_lms.model.CourseFeedback, org.example.future_developers_lms.model.User" %>
<%@ page import="org.example.future_developers_lms.model.CourseFeedback" %>

<%
    // ===== SESSION VALIDATION =====
    HttpSession sessionUser = request.getSession(false);
    User user = null;
    if (sessionUser == null || (user = (User) sessionUser.getAttribute("user")) == null) {
        response.sendRedirect(request.getContextPath() + "/views/auth/login.jsp");
        return;
    }

    // ===== FETCH FEEDBACK LIST FOR THIS STUDENT =====
    List<CourseFeedback> feedbackList = (List<CourseFeedback>) request.getAttribute("feedbackList");
    if (feedbackList == null) feedbackList = new ArrayList<>();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback | Future Developers LMS</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a2c1234567.js" crossorigin="anonymous"></script>

    <style>
        :root {
            --primary: #1e90a1;
            --sidebar-bg: #1e90a1;
            --main-bg: #f8fcfb;
        }
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Poppins', sans-serif; }
        body { display: flex; background: var(--main-bg); color: #333; min-height: 100vh; }

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
        .sidebar-header { text-align: center; padding: 1.5rem 0; border-bottom: 1px solid rgba(255,255,255,0.2); }
        .sidebar-logo { height: 60px; border-radius: 8px; }
        .sidebar-menu { list-style: none; padding: 1rem; }
        .sidebar-menu li { margin-bottom: 5px; }
        .sidebar-menu a {
            text-decoration: none;
            color: white;
            display: flex;
            align-items: center;
            padding: 10px 20px;
            border-radius: 8px;
        }
        .sidebar-menu li.active a,
        .sidebar-menu a:hover { background: rgba(255,255,255,0.2); }
        .logout-btn {
            background: #111;
            color: white;
            border: none;
            border-radius: 25px;
            padding: 10px 20px;
            cursor: pointer;
        }

        /* ===== MAIN CONTENT ===== */
        .main-content {
            margin-left: 250px;
            padding: 2rem;
            width: calc(100% - 250px);
        }
        .dashboard-header h1 {
            color: var(--primary);
            font-size: 1.8rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
        }

        /* ===== FEEDBACK FORM ===== */
        .feedback-section {
            background: #fff;
            border-radius: 16px;
            padding: 2rem;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            margin-bottom: 2rem;
        }
        .feedback-section h2 {
            font-size: 1.2rem;
            color: var(--primary);
            margin-bottom: 1rem;
        }
        .form-group { margin-bottom: 1rem; }
        label { font-weight: 500; color: #444; display: block; margin-bottom: 5px; }
        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-family: inherit;
        }
        textarea { resize: vertical; }
        .btn-submit {
            background: var(--primary);
            color: #fff;
            border: none;
            border-radius: 25px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .btn-submit:hover { background: #147c8c; }

        /* ===== FEEDBACK LIST ===== */
        .feedback-list {
            background: #fff;
            border-radius: 16px;
            padding: 2rem;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }
        .feedback-item {
            border-left: 5px solid var(--primary);
            background: #f9f9f9;
            margin-bottom: 1rem;
            padding: 1rem;
            border-radius: 10px;
        }
        .feedback-item strong { color: var(--primary); }
        .status {
            display: inline-block;
            padding: 3px 10px;
            border-radius: 10px;
            font-size: 0.9rem;
            font-weight: 600;
        }
        .status.pending { background: #fff3cd; color: #856404; }
        .status.resolved { background: #d4edda; color: #155724; }

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
        <img src="../images/FD.jpeg" alt="Logo" class="sidebar-logo">
        <h2>Future Developers</h2>
        <p style="font-size: 14px;">Welcome, <%= user.getFullName() %></p>
    </div>
    <ul class="sidebar-menu">
        <li><a href="dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="profile.jsp"><i class="fas fa-user"></i> Profile</a></li>
        <li><a href="enrolledCourses.jsp"><i class="fas fa-book"></i> Courses</a></li>
        <li><a href="lectures.jsp"><i class="fas fa-video"></i> Lectures</a></li>
        <li><a href="attendance.jsp"><i class="fas fa-check-circle"></i> Attendance</a></li>
        <li><a href="notes.jsp"><i class="fas fa-file-alt"></i> Notes</a></li>
        <li><a href="tests.jsp"><i class="fas fa-pen"></i> Tests</a></li>
        <li><a href="payments.jsp"><i class="fas fa-wallet"></i> Payments</a></li>
        <li><a href="progress.jsp"><i class="fas fa-chart-line"></i> Progress</a></li>
        <li class="active"><a href="feedback.jsp"><i class="fas fa-comment-dots"></i> Feedback</a></li>
    </ul>
    <div class="sidebar-footer text-center">
        <form action="<%= request.getContextPath() %>/LogoutServlet" method="post">
            <button type="submit" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</button>
        </form>
    </div>
</aside>

<!-- ===== MAIN CONTENT ===== -->
<main class="main-content">
    <header class="dashboard-header">
        <h1>Feedback & Support</h1>
    </header>

    <!-- ===== NEW FEEDBACK FORM ===== -->
    <section class="feedback-section">
        <h2>Submit New Feedback</h2>
        <form action="<%= request.getContextPath() %>/FeedbackServlet" method="post">
            <div class="form-group">
                <label for="subject">Subject</label>
                <input type="text" id="subject" name="subject" placeholder="Enter subject" required>
            </div>
            <div class="form-group">
                <label for="message">Message</label>
                <textarea id="message" name="message" rows="4" placeholder="Describe your issue or suggestion..." required></textarea>
            </div>
            <button type="submit" class="btn-submit">Submit Feedback</button>
        </form>
    </section>

    <!-- ===== FEEDBACK LIST ===== -->
    <section class="feedback-list">
        <h2>Your Previous Feedback</h2>
        <% if (feedbackList.isEmpty()) { %>
        <p class="text-muted mt-3">You haven’t submitted any feedback yet.</p>
        <% } else {
            for (CourseFeedback f : feedbackList) { %>
        <div class="feedback-item">
            <p><strong>Subject:</strong> <%= f.getSubject() %></p>
            <p><strong>Message:</strong> <%= f.getMessage() %></p>
            <p><strong>Status:</strong>
                <span class="status <%= f.getStatus().equalsIgnoreCase("Pending") ? "pending" : "resolved" %>">
                            <%= f.getStatus() %>
                        </span>
            </p>
            <small>Submitted on: <%= f.getSubmittedDate() %></small>
        </div>
        <% } } %>
    </section>
</main>
</body>
</html>
