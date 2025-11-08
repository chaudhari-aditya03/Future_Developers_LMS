<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.future_developers_lms.model.User" %>
<%@ page session="true" %>

<%
    // ===== SESSION VALIDATION =====
    User user = (User) session.getAttribute("user");
    if (user == null || !"STUDENT".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect(request.getContextPath() + "/views/auth/login.jsp");
        return;
    }

    // Load student profile (from servlet)
    User student = (User) request.getAttribute("student");
    if (student == null) student = user; // fallback to session user
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Student Profile | Future Developers LMS</title>

    <!-- Bootstrap + Fonts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a2c1234567.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary-color: #1e90a1;
            --sidebar-bg: #1e90a1;
            --sidebar-active: rgba(255,255,255,0.25);
            --main-bg: #f8fcfb;
            --card-bg: #fff;
            --shadow: 0 4px 12px rgba(0,0,0,0.05);
        }

        body {
            display: flex;
            background: var(--main-bg);
            font-family: 'Poppins', sans-serif;
            margin: 0;
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

        /* ===== MAIN CONTENT ===== */
        .main-content {
            margin-left: 250px;
            width: calc(100% - 250px);
            padding: 2rem;
        }

        .dashboard-header {
            background: #fff;
            padding: 15px 25px;
            border-radius: 10px;
            box-shadow: var(--shadow);
            margin-bottom: 20px;
        }

        .dashboard-header h1 {
            color: var(--primary-color);
            font-size: 1.8rem;
        }

        /* ===== PROFILE FORM ===== */
        .profile-box {
            background: var(--card-bg);
            padding: 25px 30px;
            border-radius: 15px;
            box-shadow: var(--shadow);
            max-width: 700px;
            margin: auto;
        }

        .profile-box h2 {
            color: var(--primary-color);
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            font-weight: 500;
            display: block;
            margin-bottom: 6px;
        }

        .form-group input,
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            outline: none;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            border-color: var(--primary-color);
        }

        .profile-avatar-large {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 10px;
        }

        .btn-primary {
            background: var(--primary-color);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            font-weight: 500;
        }

        .btn-primary:hover {
            background: #177d8e;
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
        <li class="active"><a href="profile.jsp"><i class="fas fa-user"></i> Profile</a></li>
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
        <h1>👤 My Profile</h1>
    </header>

    <section class="profile-section">
        <div class="profile-box">
            <h2>Personal Information</h2>

            <form action="${pageContext.request.contextPath}/UpdateProfileServlet"
                  method="post" enctype="multipart/form-data">

                <div class="form-group text-center">
                    <img src="<%= student != null && student.getProfilePhoto() != null ?
                                (request.getContextPath() + "/uploads/" + student.getProfilePhoto()) :
                                (request.getContextPath() + "/images/student-avatar.png") %>"
                         alt="Profile Photo" class="profile-avatar-large">
                    <input type="file" name="profilePhoto" accept="image/*">
                </div>

                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" name="fullName" value="<%= student.getFullName() %>" readonly>
                </div>

                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" value="<%= student.getEmail() %>" readonly>
                </div>

                <div class="form-group">
                    <label>Phone</label>
                    <input type="text" name="phone" value="<%= student.getPhone() != null ? student.getPhone() : "" %>">
                </div>

                <div class="form-group">
                    <label>Age</label>
                    <input type="number" name="age" value="<%= student.getAge() > 0 ? student.getAge() : "" %>">
                </div>

                <div class="form-group">
                    <label>Gender</label>
                    <select name="gender">
                        <option value="">-- Select Gender --</option>
                        <option value="Male" <%= "Male".equals(student.getGender()) ? "selected" : "" %>>Male</option>
                        <option value="Female" <%= "Female".equals(student.getGender()) ? "selected" : "" %>>Female</option>
                        <option value="Other" <%= "Other".equals(student.getGender()) ? "selected" : "" %>>Other</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Address</label>
                    <textarea name="address"><%= student.getAddress() != null ? student.getAddress() : "" %></textarea>
                </div>

                <button type="submit" class="btn-primary w-100 mt-3">Update Profile</button>
            </form>
        </div>
    </section>
</main>

</body>
</html>
