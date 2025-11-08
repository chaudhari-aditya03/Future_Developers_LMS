<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Tests | Future Developers LMS</title>
    <link rel="stylesheet" href="../assets/css/style.css" />
    <link rel="stylesheet" href="../assets/css/dashboard.css" />
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
        <li ><a href="../student/dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="../student/profile.jsp"><i class="fas fa-user"></i> Profile</a></li>
        <li><a href="../student/enrolledCourses.jsp"><i class="fas fa-book"></i> Courses</a></li>
        <li><a href="../student/lectures.jsp"><i class="fas fa-video"></i> Lectures</a></li>
        <li><a href="../student/attendance.jsp"><i class="fas fa-check-circle"></i> Attendance</a></li>
        <li><a href="../student/notes.jsp"><i class="fas fa-file-alt"></i> Notes</a></li>
        <li class="active"><a href="../student/tests.jsp"><i class="fas fa-pen"></i> Tests</a></li>
        <li><a href="../student/payments.jsp"><i class="fas fa-wallet"></i> Payments</a></li>
        <li><a href="../student/progress.jsp"><i class="fas fa-chart-line"></i> Progress</a></li>
        <li><a href="../student/feedback.jsp"><i class="fas fa-comment-dots"></i> Feedback</a></li>
    </ul>

    <div class="sidebar-footer">
        <button class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</button>
    </div>
</aside>

<!-- ===== MAIN CONTENT ===== -->
<main class="main-content">
    <header class="dashboard-header">
        <h1>Tests & Assessments</h1>
    </header>

    <!-- ===== TESTS TABS ===== -->
    <section class="tests-section">
        <div class="tab-buttons">
            <button class="tab-btn active" data-tab="upcoming">Upcoming Tests</button>
            <button class="tab-btn" data-tab="completed">Completed Tests</button>
        </div>

        <!-- ===== UPCOMING TESTS ===== -->
        <div class="tab-content active" id="upcoming">
            <table class="tests-table">
                <thead>
                <tr>
                    <th>Course</th>
                    <th>Test Name</th>
                    <th>Date</th>
                    <th>Duration</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>Java Full Stack</td>
                    <td>OOP Concepts Quiz</td>
                    <td>2025-10-18</td>
                    <td>30 mins</td>
                    <td><button class="btn-primary">Attempt</button></td>
                </tr>
                <tr>
                    <td>Spring Boot</td>
                    <td>REST API MCQ</td>
                    <td>2025-10-20</td>
                    <td>45 mins</td>
                    <td><button class="btn-primary">Attempt</button></td>
                </tr>
                </tbody>
            </table>
        </div>

        <!-- ===== COMPLETED TESTS ===== -->
        <div class="tab-content" id="completed">
            <table class="tests-table">
                <thead>
                <tr>
                    <th>Course</th>
                    <th>Test Name</th>
                    <th>Date</th>
                    <th>Score</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>Frontend Basics</td>
                    <td>HTML & CSS Quiz</td>
                    <td>2025-10-05</td>
                    <td>85%</td>
                    <td><button class="btn-secondary">View Result</button></td>
                </tr>
                <tr>
                    <td>Java Basics</td>
                    <td>Java Fundamentals Test</td>
                    <td>2025-10-08</td>
                    <td>92%</td>
                    <td><button class="btn-secondary">View Result</button></td>
                </tr>
                </tbody>
            </table>
        </div>
    </section>

</main>

<script src="../student/js/dashboard.js"></script>
<script src="../student/js/tests.js"></script>
</body>
</html>
