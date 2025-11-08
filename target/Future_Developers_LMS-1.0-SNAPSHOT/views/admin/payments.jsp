<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Payments | Admin Panel</title>
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
        <h1>Manage Payments & Enrollments</h1>
        <button class="add-btn"><i class="fas fa-plus-circle"></i> Add Payment</button>
    </header>

    <!-- ===== SEARCH & FILTER ===== -->
    <section class="search-filter">
        <input type="text" id="searchInput" placeholder="Search by student, course, transaction ID..." onkeyup="searchTable()">
        <select id="filterStatus" onchange="filterStatus()">
            <option value="">All Status</option>
            <option value="Paid">Paid</option>
            <option value="Pending">Pending</option>
            <option value="Refunded">Refunded</option>
        </select>
    </section>

    <!-- ===== PAYMENTS TABLE ===== -->
    <section class="table-section">
        <table id="paymentsTable">
            <thead>
            <tr>
                <th>Transaction ID</th>
                <th>Student ID</th>
                <th>Student Name</th>
                <th>Course</th>
                <th>Amount</th>
                <th>Date</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>TXN1001</td>
                <td>STU1024</td>
                <td>John Doe</td>
                <td>Java Full Stack</td>
                <td>$250</td>
                <td>2025-10-01</td>
                <td>
                    <select>
                        <option value="Paid" selected>Paid</option>
                        <option value="Pending">Pending</option>
                        <option value="Refunded">Refunded</option>
                    </select>
                </td>
                <td>
                    <button class="update-btn"><i class="fas fa-save"></i></button>
                    <button class="refund-btn"><i class="fas fa-undo-alt"></i></button>
                </td>
            </tr>
            <tr>
                <td>TXN1002</td>
                <td>STU1025</td>
                <td>Jane Smith</td>
                <td>Python Basics</td>
                <td>$150</td>
                <td>2025-10-05</td>
                <td>
                    <select>
                        <option value="Paid">Paid</option>
                        <option value="Pending" selected>Pending</option>
                        <option value="Refunded">Refunded</option>
                    </select>
                </td>
                <td>
                    <button class="update-btn"><i class="fas fa-save"></i></button>
                    <button class="refund-btn"><i class="fas fa-undo-alt"></i></button>
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
        let table = document.getElementById("paymentsTable");
        let rows = table.getElementsByTagName("tr");

        for (let i = 1; i < rows.length; i++) {
            let cells = rows[i].getElementsByTagName("td");
            let match = false;
            for (let j = 1; j < 4; j++) { // Student ID, Student Name, Course
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
        let table = document.getElementById("paymentsTable");
        let rows = table.getElementsByTagName("tr");

        for (let i = 1; i < rows.length; i++) {
            let status = rows[i].getElementsByTagName("td")[6].getElementsByTagName("select")[0].value;
            rows[i].style.display = (filter === "" || status === filter) ? "" : "none";
        }
    }

    // ===== BUTTON ACTIONS =====
    document.querySelectorAll('.update-btn').forEach(btn => {
        btn.addEventListener('click', (e) => {
            alert('Payment status updated!');
        });
    });

    document.querySelectorAll('.refund-btn').forEach(btn => {
        btn.addEventListener('click', (e) => {
            if(confirm('Are you sure you want to refund this payment?')) {
                alert('Refund processed!');
            }
        });
    });
</script>
</body>
</html>


