<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Students | Teacher Dashboard</title>
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
        <h1>👨‍🎓 Enrolled Students</h1>
        <p class="subtitle">List of students enrolled in <b>Java Full Stack Development</b></p>
    </header>

    <!-- ===== SEARCH BAR ===== -->
    <div class="search-bar">
        <input type="text" id="searchInput" placeholder="🔍 Search student by name or email...">
    </div>

    <!-- ===== STUDENTS TABLE ===== -->
    <section class="table-section">
        <table class="styled-table" id="studentsTable">
            <thead>
            <tr>
                <th>Student ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Progress</th>
                <th>Attendance</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>S101</td>
                <td>Pratiksha Dighe</td>
                <td>pratiksha@example.com</td>
                <td>85%</td>
                <td>92%</td>
                <td>
                    <a href="profile.html" class="btn-view">👁️ View</a>
                    <a href="attendance.html" class="btn-manage">📅 Mark Attendance</a>
                    <button class="btn-delete">❌ Remove</button>
                </td>
            </tr>
            <tr>
                <td>S102</td>
                <td>Rahul Sharma</td>
                <td>rahul@example.com</td>
                <td>77%</td>
                <td>88%</td>
                <td>
                    <a href="profile.html" class="btn-view">👁️ View</a>
                    <a href="attendance.html" class="btn-manage">📅 Mark Attendance</a>
                    <button class="btn-delete">❌ Remove</button>
                </td>
            </tr>
            </tbody>
        </table>
    </section>

</main>

<script>
    // Sidebar active link logic
    const menuLinks = document.querySelectorAll('.sidebar-menu li a');
    menuLinks.forEach(link => {
        link.addEventListener('click', () => {
            menuLinks.forEach(l => l.parentElement.classList.remove('active'));
            link.parentElement.classList.add('active');
        });
    });

    // Simple search filter
    const searchInput = document.getElementById('searchInput');
    const table = document.getElementById('studentsTable');
    searchInput.addEventListener('keyup', () => {
        const filter = searchInput.value.toLowerCase();
        const rows = table.querySelectorAll('tbody tr');
        rows.forEach(row => {
            const text = row.textContent.toLowerCase();
            row.style.display = text.includes(filter) ? '' : 'none';
        });
    });
</script>

</body>
</html>
