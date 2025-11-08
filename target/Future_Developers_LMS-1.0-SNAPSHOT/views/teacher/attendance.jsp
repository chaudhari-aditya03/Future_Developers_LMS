
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Attendance | Future Developers LMS</title>
    <link rel="stylesheet" href="../css/style.css" />
    <link rel="stylesheet" href="../css/dashboard.css" />
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
</aside>

<!-- ===== MAIN CONTENT ===== -->
<main class="main-content">
    <header class="dashboard-header">
        <h1>Manage Attendance</h1>
        <div>
            <button class="btn-primary" id="saveAttendanceBtn"><i class="fas fa-save"></i> Save Attendance</button>
        </div>
    </header>

    <!-- ===== ATTENDANCE TABLE ===== -->
    <!-- ===== ATTENDANCE TABLE ===== -->
    <section class="table-section">
        <div class="table-header">
            <h2>Student Attendance</h2>
            <div class="search-bar">
                <input type="text" placeholder="Search attendance...">
                <button><i class="fas fa-search"></i></button>
            </div>
        </div>

        <table class="styled-table attendance-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Student Name</th>
                <th>Course</th>
                <th>Lecture</th>
                <th>Date</th>
                <th>Present</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>John Doe</td>
                <td>Java Full Stack</td>
                <td>OOP Concepts</td>
                <td>2025-10-17</td>
                <td><input type="checkbox" checked></td>
            </tr>
            <tr>
                <td>2</td>
                <td>Jane Smith</td>
                <td>Web Development</td>
                <td>HTML & CSS Basics</td>
                <td>2025-10-17</td>
                <td><input type="checkbox"></td>
            </tr>
            <tr>
                <td>3</td>
                <td>Mike Johnson</td>
                <td>Python Programming</td>
                <td>Python Loops</td>
                <td>2025-10-17</td>
                <td><input type="checkbox" checked></td>
            </tr>
            </tbody>
        </table>
    </section>


</main>

<script>
    // ===== SAVE ATTENDANCE LOGIC =====
    document.getElementById('saveAttendanceBtn').onclick = function() {
        const table = document.querySelector('.data-table tbody');
        const rows = table.querySelectorAll('tr');
        let attendanceData = [];

        rows.forEach(row => {
            const cells = row.querySelectorAll('td');
            attendanceData.push({
                studentId: cells[0].innerText,
                studentName: cells[1].innerText,
                course: cells[2].innerText,
                lecture: cells[3].innerText,
                date: cells[4].innerText,
                present: cells[5].querySelector('input').checked
            });
        });

        console.log(attendanceData);
        alert('Attendance data saved! (Connect this to TeacherAttendanceServlet)');
        // TODO: Send attendanceData via AJAX to servlet for DB save
    }
</script>

</body>
</html>
