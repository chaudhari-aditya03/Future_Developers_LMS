<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Students | Admin Panel</title>
    <link rel="stylesheet" href="../css/admin.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
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
        <h1>Manage Students</h1>
        <button class="add-btn"><i class="fas fa-user-plus"></i> Add New Student</button>
    </header>

    <!-- ===== SEARCH & FILTER ===== -->
    <section class="search-filter">
        <input type="text" id="searchInput" placeholder="Search by name, email, ID..." onkeyup="searchTable()">
        <select id="filterCourse" onchange="filterCourse()">
            <option value="">All Courses</option>
            <option value="Java Full Stack">Java Full Stack</option>
            <option value="Python Development">Python Development</option>
            <option value="Frontend Web Dev">Frontend Web Dev</option>
        </select>
    </section>

    <!-- ===== STUDENTS TABLE ===== -->
    <section class="table-section">
        <table id="studentsTable">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Course</th>
                <th>Phone</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>STU1001</td>
                <td>John Doe</td>
                <td>john@example.com</td>
                <td>Java Full Stack</td>
                <td>9876543210</td>
                <td>
                    <button class="edit-btn"><i class="fas fa-edit"></i></button>
                    <button class="delete-btn"><i class="fas fa-trash-alt"></i></button>
                    <button class="reset-btn"><i class="fas fa-key"></i></button>
                </td>
            </tr>
            <tr>
                <td>STU1002</td>
                <td>Jane Smith</td>
                <td>jane@example.com</td>
                <td>Python Development</td>
                <td>9876543211</td>
                <td>
                    <button class="edit-btn"><i class="fas fa-edit"></i></button>
                    <button class="delete-btn"><i class="fas fa-trash-alt"></i></button>
                    <button class="reset-btn"><i class="fas fa-key"></i></button>
                </td>
            </tr>
            <!-- Add more rows dynamically -->
            </tbody>
        </table>
    </section>
</main>

<script src="../js/admin.js"></script>
<script>
    // ===== SEARCH FUNCTION =====
    function searchTable() {
        let input = document.getElementById("searchInput").value.toLowerCase();
        let table = document.getElementById("studentsTable");
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

    // ===== FILTER BY COURSE =====
    function filterCourse() {
        let select = document.getElementById("filterCourse");
        let filter = select.value;
        let table = document.getElementById("studentsTable");
        let rows = table.getElementsByTagName("tr");

        for (let i = 1; i < rows.length; i++) {
            let course = rows[i].getElementsByTagName("td")[3].innerText;
            rows[i].style.display = (filter === "" || course === filter) ? "" : "none";
        }
    }
</script>
</body>
</html>
