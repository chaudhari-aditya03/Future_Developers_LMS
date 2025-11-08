<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Activity Logs</title>
    <link rel="stylesheet" href="../css/admin.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a2c1234567.js" crossorigin="anonymous"></script>
</head>
<body>

<!-- ===== SIDEBAR ===== -->
<aside class="sidebar">
    <div class="sidebar-header">
        <img src="../images/FD.jpeg" alt="Logo" class="sidebar-logo">
        <h2>Admin</h2>
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
        <h1>Admin Activity Logs</h1>
    </header>

    <!-- ===== FILTERS ===== -->
    <section class="filters">
        <input type="text" id="searchInput" placeholder="Search by admin, action, or table..." />
        <select id="actionFilter">
            <option value="">All Actions</option>
            <option value="INSERT">INSERT</option>
            <option value="UPDATE">UPDATE</option>
            <option value="DELETE">DELETE</option>
        </select>
        <select id="tableFilter">
            <option value="">All Tables</option>
            <option value="students">Students</option>
            <option value="teachers">Teachers</option>
            <option value="courses">Courses</option>
            <option value="lectures">Lectures</option>
            <option value="payments">Payments</option>
        </select>
    </section>

    <!-- ===== LOGS TABLE ===== -->
    <section class="table-section">
        <table id="logsTable">
            <thead>
            <tr>
                <th>Admin Name</th>
                <th>Action</th>
                <th>Table</th>
                <th>Record ID</th>
                <th>Timestamp</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>John Doe</td>
                <td>INSERT</td>
                <td>students</td>
                <td>STU1024</td>
                <td>2025-10-15 10:23:45</td>
            </tr>
            <tr>
                <td>Emily Smith</td>
                <td>UPDATE</td>
                <td>courses</td>
                <td>COURSE05</td>
                <td>2025-10-14 16:12:33</td>
            </tr>
            <tr>
                <td>John Doe</td>
                <td>DELETE</td>
                <td>lectures</td>
                <td>LECT101</td>
                <td>2025-10-13 14:05:21</td>
            </tr>
            <tr>
                <td>Emily Smith</td>
                <td>INSERT</td>
                <td>payments</td>
                <td>TXN1002</td>
                <td>2025-10-12 11:45:10</td>
            </tr>
            </tbody>
        </table>
    </section>
</main>

<script>
    // ===== LOGOUT =====
    document.querySelector('.logout-btn').addEventListener('click', () => {
        alert('You have been logged out!');
        window.location.href = '../login.html';
    });

    // ===== FILTER & SEARCH FUNCTIONALITY =====
    const searchInput = document.getElementById('searchInput');
    const actionFilter = document.getElementById('actionFilter');
    const tableFilter = document.getElementById('tableFilter');
    const logsTable = document.getElementById('logsTable').getElementsByTagName('tbody')[0];

    function filterLogs() {
        const searchText = searchInput.value.toLowerCase();
        const actionText = actionFilter.value.toLowerCase();
        const tableText = tableFilter.value.toLowerCase();

        Array.from(logsTable.rows).forEach(row => {
            const admin = row.cells[0].textContent.toLowerCase();
            const action = row.cells[1].textContent.toLowerCase();
            const table = row.cells[2].textContent.toLowerCase();

            const matchesSearch = admin.includes(searchText) || action.includes(searchText) || table.includes(searchText);
            const matchesAction = !actionText || action === actionText;
            const matchesTable = !tableText || table === tableText;

            row.style.display = (matchesSearch && matchesAction && matchesTable) ? '' : 'none';
        });
    }

    searchInput.addEventListener('keyup', filterLogs);
    actionFilter.addEventListener('change', filterLogs);
    tableFilter.addEventListener('change', filterLogs);
</script>

</body>
</html>
