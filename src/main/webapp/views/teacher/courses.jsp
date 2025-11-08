<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>My Courses | Teacher Dashboard</title>
    <link rel="stylesheet" href="../css/style.css" />
    <link rel="stylesheet" href="../css/dashboard.css" />
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
        <li><a href="teacher-dashboard.html"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li class="active"><a href="courses.html"><i class="fas fa-book"></i> My Courses</a></li>
        <li><a href="lectures.html"><i class="fas fa-video"></i> Lectures</a></li>
        <li><a href="notes.html"><i class="fas fa-file-alt"></i> Notes</a></li>
        <li><a href="tests.html"><i class="fas fa-pen"></i> Tests</a></li>
        <li><a href="results.html"><i class="fas fa-chart-bar"></i> Results</a></li>
        <li><a href="attendance.html"><i class="fas fa-check-circle"></i> Attendance</a></li>
        <li><a href="reports.html"><i class="fas fa-chart-line"></i> Reports</a></li>
        <li><a href="profile.html"><i class="fas fa-user-cog"></i> Profile</a></li>
    </ul>

    <div class="sidebar-footer">
        <button class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</button>
    </div>
</aside>

<!-- ===== MAIN CONTENT ===== -->
<main class="main-content">

    <header class="dashboard-header">
        <h1>📚 My Courses</h1>
        <p class="subtitle">View all assigned courses and manage enrolled students</p>
    </header>

    <!-- ===== COURSES TABLE ===== -->
    <section class="table-section">
        <table class="styled-table">
            <thead>
            <tr>
                <th>Course ID</th>
                <th>Course Name</th>
                <th>Duration</th>
                <th>Students Enrolled</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>C101</td>
                <td>Java Full Stack Development</td>
                <td>6 Months</td>
                <td>45</td>
                <td><span class="status active">Active</span></td>
                <td>
                    <a href="students.html" class="btn-view">👨‍🎓 View Students</a>
                    <a href="lectures.html" class="btn-manage">🎥 Manage Lectures</a>
                </td>
            </tr>
            <tr>
                <td>C102</td>
                <td>Spring Boot & Microservices</td>
                <td>4 Months</td>
                <td>38</td>
                <td><span class="status active">Active</span></td>
                <td>
                    <a href="students.html" class="btn-view">👨‍🎓 View Students</a>
                    <a href="lectures.html" class="btn-manage">🎥 Manage Lectures</a>
                </td>
            </tr>
            <tr>
                <td>C103</td>
                <td>Web Development Fundamentals</td>
                <td>3 Months</td>
                <td>52</td>
                <td><span class="status inactive">Inactive</span></td>
                <td>
                    <a href="students.html" class="btn-view">👨‍🎓 View Students</a>
                    <a href="lectures.html" class="btn-manage">🎥 Manage Lectures</a>
                </td>
            </tr>
            </tbody>
        </table>
    </section>

</main>

<script>
    // Highlight active sidebar link
    const menuLinks = document.querySelectorAll('.sidebar-menu li a');
    menuLinks.forEach(link => {
        link.addEventListener('click', () => {
            menuLinks.forEach(l => l.parentElement.classList.remove('active'));
            link.parentElement.classList.add('active');
        });
    });
</script>

</body>
</html>
