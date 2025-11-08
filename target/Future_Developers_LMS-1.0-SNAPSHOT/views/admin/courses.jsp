<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Courses | Admin Panel</title>
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
        <h1>Manage Courses</h1>
        <button class="add-btn"><i class="fas fa-plus-circle"></i> Add New Course</button>
    </header>

    <!-- ===== SEARCH & FILTER ===== -->
    <section class="search-filter">
        <input type="text" id="searchInput" placeholder="Search by name or ID..." onkeyup="searchTable()">
        <select id="filterStatus" onchange="filterStatus()">
            <option value="">All Status</option>
            <option value="Active">Active</option>
            <option value="Inactive">Inactive</option>
        </select>
    </section>

    <!-- ===== COURSES TABLE ===== -->
    <section class="table-section">
        <table id="coursesTable">
            <thead>
            <tr>
                <th>ID</th>
                <th>Course Name</th>
                <th>Assigned Teacher</th>
                <th>Status</th>
                <th>Thumbnail</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>CRS101</td>
                <td>Java Full Stack</td>
                <td>Michael Brown</td>
                <td>Active</td>
                <td><img src="../images/java.png" alt="Java" class="thumb"></td>
                <td>
                    <button class="edit-btn"><i class="fas fa-edit"></i></button>
                    <button class="delete-btn"><i class="fas fa-trash-alt"></i></button>
                    <button class="assign-btn"><i class="fas fa-chalkboard-teacher"></i></button>
                </td>
            </tr>
            <tr>
                <td>CRS102</td>
                <td>Python Development</td>
                <td>Sarah Johnson</td>
                <td>Inactive</td>
                <td><img src="../images/python.png" alt="Python" class="thumb"></td>
                <td>
                    <button class="edit-btn"><i class="fas fa-edit"></i></button>
                    <button class="delete-btn"><i class="fas fa-trash-alt"></i></button>
                    <button class="assign-btn"><i class="fas fa-chalkboard-teacher"></i></button>
                </td>
            </tr>
            <!-- More rows dynamically -->
            </tbody>
        </table>
    </section>
</main>

<script src="../js/admin.js"></script>
<script>
    // ===== SEARCH FUNCTION =====
    function searchTable() {
        let input = document.getElementById("searchInput").value.toLowerCase();
        let table = document.getElementById("coursesTable");
        let rows = table.getElementsByTagName("tr");

        for (let i = 1; i < rows.length; i++) {
            let cells = rows[i].getElementsByTagName("td");
            let match = false;
            for (let j = 0; j < cells.length - 1; j++) {
                if (cells[j].innerText.toLowerCase().includes(input)) {
                    match = true;
                    break;
                }
            }
            rows[i].style.display = match ? "" : "none";
        }
    }

    // ===== FILTER BY STATUS =====
    function filterStatus() {
        let select = document.getElementById("filterStatus");
        let filter = select.value;
        let table = document.getElementById("coursesTable");
        let rows = table.getElementsByTagName("tr");

        for (let i = 1; i < rows.length; i++) {
            let status = rows[i].getElementsByTagName("td")[3].innerText;
            rows[i].style.display = (filter === "" || status === filter) ? "" : "none";
        }
    }
</script>
</body>
</html>

