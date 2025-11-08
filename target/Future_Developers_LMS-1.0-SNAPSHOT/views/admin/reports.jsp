<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Reports & Analytics</title>
    <link rel="stylesheet" href="../css/admin.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://kit.fontawesome.com/a2c1234567.js" crossorigin="anonymous"></script>
</head>
<body>

<!-- ===== SIDEBAR ===== -->
<aside class="sidebar">
    <div class="sidebar-header">
        <img src="../images/FD.jpeg" alt="Logo" class="sidebar-logo">
        <h2>Admin </h2>
    </div>
    <ul class="sidebar-menu">
        <li class="active">
            <a href="dashboard.html"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        </li>
        <li><a href="students.html"><i class="fas fa-user-graduate"></i> Students</a></li>
        <li><a href="teachers.html"><i class="fas fa-chalkboard-teacher"></i> Teachers</a></li>
        <li><a href="courses.html"><i class="fas fa-book"></i> Courses</a></li>
        <li><a href="lectures.html"><i class="fas fa-video"></i> Lectures</a></li>
        <li><a href="notes.html"><i class="fas fa-file-alt"></i> Notes</a></li>
        <li><a href="tests.html"><i class="fas fa-pen"></i> Tests</a></li>
        <li><a href="results.html"><i class="fas fa-chart-bar"></i> Results</a></li>
        <li><a href="attendance.html"><i class="fas fa-check-circle"></i> Attendance</a></li>
        <li><a href="payments.html"><i class="fas fa-wallet"></i> Payments</a></li>
        <li><a href="reports.html"><i class="fas fa-chart-line"></i> Reports</a></li>
        <li><a href="activity_logs.html"><i class="fas fa-clipboard-list"></i> Activity Logs</a></li>
        <li><a href="profile.html"><i class="fas fa-user-cog"></i> Profile</a></li>
    </ul>
    <div class="sidebar-footer">
        <button class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</button>
    </div>
</aside>

<!-- ===== MAIN CONTENT ===== -->
<main class="main-content">
    <header class="dashboard-header">
        <h1>Reports & Analytics</h1>
    </header>

    <!-- ===== SUMMARY CARDS ===== -->
    <section class="dashboard-cards">
        <div class="card">
            <i class="fas fa-user-graduate"></i>
            <h3>120</h3>
            <p>Total Students</p>
        </div>
        <div class="card">
            <i class="fas fa-chalkboard-teacher"></i>
            <h3>15</h3>
            <p>Total Teachers</p>
        </div>
        <div class="card">
            <i class="fas fa-book"></i>
            <h3>35</h3>
            <p>Total Courses</p>
        </div>
        <div class="card">
            <i class="fas fa-wallet"></i>
            <h3>$12,500</h3>
            <p>Total Revenue</p>
        </div>
    </section>

    <!-- ===== CHARTS ===== -->
    <section class="charts-section">
        <div class="chart-card">
            <h3>Revenue Trend (Last 6 Months)</h3>
            <canvas id="revenueChart"></canvas>
        </div>
        <div class="chart-card">
            <h3>Student Enrollment by Course</h3>
            <canvas id="enrollmentChart"></canvas>
        </div>
        <div class="chart-card">
            <h3>Attendance Overview</h3>
            <canvas id="attendanceChart"></canvas>
        </div>
    </section>

    <!-- ===== RECENT ACTIVITY ===== -->
    <section class="recent-section">
        <h2>Recent Admin Activity</h2>
        <ul class="activity-list">
            <li>John updated course "Java Full Stack"</li>
            <li>Emily added new teacher "Mr. Smith"</li>
            <li>Payment TXN1002 verified</li>
            <li>Lecture "Spring Boot Basics" approved</li>
        </ul>
    </section>
</main>

<script>
    // ===== REVENUE CHART =====
    const revenueCtx = document.getElementById('revenueChart').getContext('2d');
    const revenueChart = new Chart(revenueCtx, {
        type: 'line',
        data: {
            labels: ['May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'],
            datasets: [{
                label: 'Revenue ($)',
                data: [1500, 1800, 2000, 2500, 2800, 2500],
                backgroundColor: 'rgba(30,144,161,0.2)',
                borderColor: '#1e90a1',
                borderWidth: 2,
                fill: true,
                tension: 0.4
            }]
        },
        options: { responsive: true }
    });

    // ===== ENROLLMENT CHART =====
    const enrollmentCtx = document.getElementById('enrollmentChart').getContext('2d');
    const enrollmentChart = new Chart(enrollmentCtx, {
        type: 'bar',
        data: {
            labels: ['Java Full Stack', 'Python Basics', 'Frontend', 'Data Science', 'AI & ML'],
            datasets: [{
                label: 'Enrolled Students',
                data: [40, 30, 25, 15, 10],
                backgroundColor: '#1e90a1'
            }]
        },
        options: { responsive: true }
    });

    // ===== ATTENDANCE CHART =====
    const attendanceCtx = document.getElementById('attendanceChart').getContext('2d');
    const attendanceChart = new Chart(attendanceCtx, {
        type: 'doughnut',
        data: {
            labels: ['Present', 'Absent', 'Late'],
            datasets: [{
                label: 'Attendance',
                data: [78, 15, 7],
                backgroundColor: ['#1e90a1', '#ff6b6b', '#fcd34d']
            }]
        },
        options: { responsive: true }
    });

    // ===== LOGOUT =====
    document.querySelector('.logout-btn').addEventListener('click', () => {
        alert('You have been logged out!');
        window.location.href = '../login.html';
    });
</script>
</body>
</html>
