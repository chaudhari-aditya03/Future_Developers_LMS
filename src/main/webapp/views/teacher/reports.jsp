<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Reports | Future Developers LMS</title>
    <link rel="stylesheet" href="../css/style.css" />
    <link rel="stylesheet" href="../css/dashboard.css" />
    <script src="https://kit.fontawesome.com/a2c1234567.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

<!-- ===== SIDEBAR ===== -->
<aside class="sidebar">
    <div class="sidebar-header">
        <img src="../images/FD.jpeg" alt="Logo" class="sidebar-logo">
        <h2>Future Developers</h2>
    </div>
    <ul class="sidebar-menu">
        <li class="active"><a href="teacher-dashboard.html"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="courses.html"><i class="fas fa-book"></i> My Courses</a></li>
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
        <h1>Student Performance Reports</h1>
    </header>

    <!-- ===== SUMMARY CARDS ===== -->
    <section class="dashboard-cards">
        <div class="card">
            <i class="fas fa-user-graduate"></i>
            <h3>120</h3>
            <p>Total Students</p>
        </div>
        <div class="card">
            <i class="fas fa-book"></i>
            <h3>5</h3>
            <p>Active Courses</p>
        </div>
        <div class="card">
            <i class="fas fa-play-circle"></i>
            <h3>38</h3>
            <p>Lectures Uploaded</p>
        </div>
        <div class="card">
            <i class="fas fa-pen"></i>
            <h3>12</h3>
            <p>Tests Created</p>
        </div>
    </section>

    <!-- ===== PERFORMANCE CHART ===== -->
    <section class="charts-section">
        <h2>Average Scores by Course</h2>
        <canvas id="scoreChart" width="400" height="200"></canvas>
    </section>

    <section class="charts-section">
        <h2>Attendance Summary</h2>
        <canvas id="attendanceChart" width="400" height="200"></canvas>
    </section>

    <!-- ===== RECENT RESULTS TABLE ===== -->
    <!-- ===== RECENT RESULTS TABLE ===== -->
    <section class="table-section">
        <div class="table-header">
            <h2>Recent Test Results</h2>
            <div class="search-bar">
                <input type="text" placeholder="Search results...">
                <button><i class="fas fa-search"></i></button>
            </div>
        </div>

        <table class="styled-table results-table">
            <thead>
            <tr>
                <th>Student</th>
                <th>Course</th>
                <th>Test</th>
                <th>Score</th>
                <th>Status</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>John Doe</td>
                <td>Java Full Stack</td>
                <td>OOP Quiz</td>
                <td>85%</td>
                <td><span class="status passed">Passed</span></td>
            </tr>
            <tr>
                <td>Jane Smith</td>
                <td>Web Development</td>
                <td>HTML & CSS Test</td>
                <td>92%</td>
                <td><span class="status passed">Passed</span></td>
            </tr>
            <tr>
                <td>Mike Johnson</td>
                <td>Python Programming</td>
                <td>Loops & Functions</td>
                <td>78%</td>
                <td><span class="status passed">Passed</span></td>
            </tr>
            </tbody>
        </table>
    </section>

</main>

<script>
    // ===== SCORE CHART =====
    const ctxScore = document.getElementById('scoreChart').getContext('2d');
    const scoreChart = new Chart(ctxScore, {
        type: 'bar',
        data: {
            labels: ['Java', 'Web Dev', 'Python', 'Spring Boot', 'SQL'],
            datasets: [{
                label: 'Average Score (%)',
                data: [85, 92, 78, 88, 90],
                backgroundColor: '#1e90a1'
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: { display: false },
                title: { display: true, text: 'Average Scores by Course' }
            },
            scales: {
                y: { beginAtZero: true, max: 100 }
            }
        }
    });

    // ===== ATTENDANCE CHART =====
    const ctxAttend = document.getElementById('attendanceChart').getContext('2d');
    const attendanceChart = new Chart(ctxAttend, {
        type: 'line',
        data: {
            labels: ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
            datasets: [{
                label: 'Average Attendance (%)',
                data: [92, 88, 95, 90],
                fill: false,
                borderColor: '#0b6e78',
                tension: 0.3
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: { display: true, position: 'top' }
            },
            scales: {
                y: { beginAtZero: true, max: 100 }
            }
        }
    });
</script>

</body>
</html>
