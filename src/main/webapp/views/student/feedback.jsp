<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ page import="java.util.*, com.myclassportal.model.Feedback" %>--%>
<%--<%--%>
<%--    // Example data (replace with actual DAO/Service)--%>
<%--    List<Feedback> feedbackList = (List<Feedback>) request.getAttribute("feedbackList");--%>
<%--    if (feedbackList == null) {--%>
<%--        feedbackList = new ArrayList<>();--%>
<%--        feedbackList.add(new Feedback("Issue with Lecture Video", "The video on Spring Boot REST API is not playing.", "Pending", "2 days ago"));--%>
<%--        feedbackList.add(new Feedback("Course Material Request", "Please upload more practice PDFs for Java OOPs.", "Resolved", "1 week ago"));--%>
<%--    }--%>
<%--%>--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback | Future Developers LMS</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a2c1234567.js" crossorigin="anonymous"></script>

    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Poppins', sans-serif; }
        body { display: flex; background: #f4f6fb; color: #333; min-height: 100vh; }

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
        }

        .sidebar-header {
            text-align: center;
        }

        .sidebar-logo {
            width: 65px;
            border-radius: 50%;
            margin-bottom: 8px;
        }

        .sidebar h2 {
            font-size: 18px;
            color: #fff;
            letter-spacing: 0.5px;
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
            margin-right: 10px;
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
            padding: 30px 40px;
            flex: 1;
        }

        .dashboard-header h1 {
            font-size: 26px;
            font-weight: 600;
            color: #1e3c72;
            margin-bottom: 20px;
        }

        /* ===== FEEDBACK FORM ===== */
        .feedback-section {
            background: #fff;
            padding: 25px;
            border-radius: 15px;
            margin-bottom: 30px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.08);
            transition: 0.3s ease;
        }

        .feedback-section:hover {
            transform: translateY(-3px);
        }

        .feedback-section h2 {
            font-size: 20px;
            margin-bottom: 15px;
            color: #2a5298;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: 500;
            margin-bottom: 6px;
            display: block;
            color: #333;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 10px;
            outline: none;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        textarea:focus {
            border-color: #00bcd4;
        }

        .btn-submit {
            align-self: flex-start;
            background: #00bcd4;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            cursor: pointer;
            font-weight: 500;
            transition: background 0.3s;
        }

        .btn-submit:hover {
            background: #0192a2;
        }

        /* ===== FEEDBACK LIST ===== */
        .feedback-list {
            list-style: none;
        }

        .feedback-list li {
            background: #f9f9f9;
            margin-bottom: 15px;
            padding: 15px;
            border-radius: 12px;
            border-left: 5px solid #1e3c72;
            transition: transform 0.3s ease;
        }

        .feedback-list li:hover {
            transform: translateX(4px);
        }

        .feedback-list strong {
            color: #2a5298;
        }

        .status {
            font-weight: 600;
            padding: 3px 8px;
            border-radius: 12px;
        }

        .status.pending {
            background: #fff3cd;
            color: #856404;
        }

        .status.resolved {
            background: #d4edda;
            color: #155724;
        }

        small {
            color: #777;
            font-size: 13px;
        }

        /* ===== RESPONSIVE ===== */
        @media(max-width: 768px) {
            .sidebar { width: 200px; }
            .main-content { margin-left: 200px; padding: 20px; }
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
        <li><a href="<%= request.getContextPath() %>/CourseServlet?action=enrolled"><i class="fas fa-book"></i> Courses</a></li>
        <li><a href="<%= request.getContextPath() %>/LectureServlet"><i class="fas fa-video"></i> Lectures</a></li>
        <li><a href="<%= request.getContextPath() %>/AttendanceServlet"><i class="fas fa-check-circle"></i> Attendance</a></li>
        <li><a href="<%= request.getContextPath() %>/NotesServlet"><i class="fas fa-file-alt"></i> Notes</a></li>
        <li><a href="<%= request.getContextPath() %>/TestServlet"><i class="fas fa-pen"></i> Tests</a></li>
        <li><a href="<%= request.getContextPath() %>/PaymentServlet"><i class="fas fa-wallet"></i> Payments</a></li>
        <li><a href="<%= request.getContextPath() %>/ProgressServlet"><i class="fas fa-chart-line"></i> Progress</a></li>
        <li class="active"><a href="<%= request.getContextPath() %>/FeedbackServlet"><i class="fas fa-comment-dots"></i> Feedback</a></li>
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
        <h1>Feedback & Support</h1>
    </header>

    <!-- Submit Feedback -->
    <section class="feedback-section">
        <h2>Submit New Feedback</h2>
        <form action="<%= request.getContextPath() %>/FeedbackServlet" method="post">
            <div class="form-group">
                <label for="subject">Subject</label>
                <input type="text" id="subject" name="subject" placeholder="Enter subject" required>
            </div>
            <div class="form-group">
                <label for="message">Message</label>
                <textarea id="message" name="message" rows="5" placeholder="Write your message..." required></textarea>
            </div>
            <button type="submit" class="btn-submit">Submit Feedback</button>
        </form>
    </section>

    <!-- Previous Feedback -->
    <section class="feedback-section">
        <h2>Previous Feedback</h2>
        <ul class="feedback-list">
<%--            <% for (Feedback f : feedbackList) { %>--%>
<%--            <li>--%>
<%--                <p><strong>Subject:</strong> <%= f.getSubject() %></p>--%>
<%--                <p><strong>Message:</strong> <%= f.getMessage() %></p>--%>
<%--                <p><strong>Status:</strong>--%>
<%--                    <span class="status <%= f.getStatus().equalsIgnoreCase("Pending") ? "pending" : "resolved" %>">--%>
<%--                            <%= f.getStatus() %>--%>
<%--                        </span>--%>
<%--                </p>--%>
<%--                <p><small>Submitted: <%= f.getSubmittedDate() %></small></p>--%>
<%--            </li>--%>
<%--            <% } %>--%>
        </ul>
    </section>
</main>
</body>
</html>
