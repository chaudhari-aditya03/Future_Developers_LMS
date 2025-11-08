<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Results | Admin Panel</title>
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
        <h1>Manage Student Results</h1>
        <button class="add-btn"><i class="fas fa-plus-circle"></i> Add Result</button>
    </header>

    <!-- ===== SEARCH & FILTER ===== -->
    <section class="search-filter">
        <input type="text" id="searchInput" placeholder="Search by student, test, or course..." onkeyup="searchTable()">
        <select id="filterStatus" onchange="filterStatus()">
            <option value="">All Status</option>
            <option value="Pass">Pass</option>
            <option value="Fail">Fail</option>
        </select>
    </section>

    <!-- ===== RESULTS TABLE ===== -->
    <section class="table-section">
        <table id="resultsTable">
            <thead>
            <tr>
                <th>Student ID</th>
                <th>Student Name</th>
                <th>Test</th>
                <th>Course</th>
                <th>Marks Obtained</th>
                <th>Total Marks</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>STU1024</td>
                <td>John Doe</td>
                <td>Java Basics Quiz</td>
                <td>Java Full Stack</td>
                <td contenteditable="true">85</td>
                <td>100</td>
                <td>Pass</td>
                <td>
                    <button class="update-btn"><i class="fas fa-save"></i></button>
                    <button class="delete-btn"><i class="fas fa-trash-alt"></i></button>
                </td>
            </tr>
            <tr>
                <td>STU1025</td>
                <td>Jane Smith</td>
                <td>Spring Boot MCQ Test</td>
                <td>Java Full Stack</td>
                <td contenteditable="true">65</td>
                <td>100</td>
                <td>Pass</td>
                <td>
                    <button class="update-btn"><i class="fas fa-save"></i></button>
                    <button class="delete-btn"><i class="fas fa-trash-alt"></i></button>
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
        let table = document.getElementById("resultsTable");
        let rows = table.getElementsByTagName("tr");

        for (let i = 1; i < rows.length; i++) {
            let cells = rows[i].getElementsByTagName("td");
            let match = false;
            for (let j = 1; j < 4; j++) { // Name, Test, Course
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
        let table = document.getElementById("resultsTable");
        let rows = table.getElementsByTagName("tr");

        for (let i = 1; i < rows.length; i++) {
            let status = rows[i].getElementsByTagName("td")[6].innerText;
            rows[i].style.display = (filter === "" || status === filter) ? "" : "none";
        }
    }
</script>
</body>
</html>
