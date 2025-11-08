<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Attendance | Future Developers LMS</title>

    <!-- Bootstrap + Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a2c1234567.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary: #1e90a1;
            --bg-main: #f9fbfd;
            --sidebar-bg: #1e90a1;
            --text-dark: #1f2937;
            --text-light: #fff;
        }

        body {
            display: flex;
            font-family: 'Poppins', sans-serif;
            background: var(--bg-main);
            margin: 0;
        }

        /* ===== SIDEBAR ===== */
        .sidebar {
            width: 250px;
            background: var(--sidebar-bg);
            color: white;
            height: 100vh;
            position: fixed;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            overflow-y: auto;
        }

        .sidebar-header {
            text-align: center;
            padding: 1.5rem 0;
            border-bottom: 1px solid rgba(255,255,255,0.2);
        }

        .sidebar-logo {
            height: 60px;
            border-radius: 8px;
        }

        .sidebar-menu {
            list-style: none;
            padding: 1rem;
        }

        .sidebar-menu li {
            margin-bottom: 5px;
        }

        .sidebar-menu li a {
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 10px 20px;
            border-radius: 8px;
            transition: background 0.3s;
        }

        .sidebar-menu li a:hover,
        .sidebar-menu li.active a {
            background: rgba(255, 255, 255, 0.2);
        }

        .sidebar-footer {
            text-align: center;
            padding: 1rem;
            border-top: 1px solid rgba(255,255,255,0.2);
        }

        .logout-btn {
            background: #1b1b2f;
            color: white;
            border: none;
            padding: 0.6rem 1.2rem;
            border-radius: 25px;
            cursor: pointer;
            transition: 0.3s;
        }

        .logout-btn:hover {
            background: #111;
        }

        /* ===== MAIN CONTENT ===== */
        .main-content {
            margin-left: 250px;
            width: calc(100% - 250px);
            padding: 2rem;
        }

        .dashboard-header h1 {
            color: var(--primary);
            font-weight: 600;
            font-size: 1.8rem;
        }

        /* ===== OVERALL ATTENDANCE CIRCLE ===== */
        .progress-circle {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            background: conic-gradient(var(--primary) 0% 88%, #e0e0e0 88% 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            margin: 1rem auto;
        }

        .progress-circle span {
            position: absolute;
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--text-dark);
        }

        /* ===== COURSE ATTENDANCE ===== */
        .course-card {
            background: linear-gradient(135deg, #89f7fe, #66a6ff);
            color: white;
            border-radius: 16px;
            padding: 1.5rem;
            text-align: center;
            transition: transform 0.3s;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .course-card:nth-child(2) {
            background: linear-gradient(135deg, #f6d365, #fda085);
        }

        .course-card:nth-child(3) {
            background: linear-gradient(135deg, #84fab0, #8fd3f4);
        }

        .course-card:hover {
            transform: translateY(-5px);
        }

        .progress-bar {
            height: 10px;
            background: rgba(255,255,255,0.4);
            border-radius: 5px;
            overflow: hidden;
            margin-top: 10px;
        }

        .progress {
            height: 10px;
            background: #fff;
            border-radius: 5px;
            width: 0;
            transition: width 1.5s ease-in-out;
        }

        .btn-primary {
            background: var(--primary);
            border: none;
            border-radius: 30px;
            padding: 0.7rem 1.5rem;
            margin-top: 1.5rem;
            transition: 0.3s;
        }

        .btn-primary:hover {
            background: #147c8c;
        }

        @media (max-width: 992px) {
            .sidebar { display: none; }
            .main-content { margin-left: 0; width: 100%; }
        }
    </style>
</head>
<body>

<!-- ===== SIDEBAR ===== -->
<aside class="sidebar">
    <div class="sidebar-header">
        <img src="../images/FD.jpeg" alt="Logo" class="sidebar-logo">
        <h2>Future Developers</h2>
    </div>
    <ul class="sidebar-menu">
        <li><a href="../student/dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="../student/profile.jsp"><i class="fas fa-user"></i> Profile</a></li>
        <li><a href="../student/enrolledCourses.jsp"><i class="fas fa-book"></i> Courses</a></li>
        <li><a href="../student/lectures.jsp"><i class="fas fa-video"></i> Lectures</a></li>
        <li class="active"><a href="../student/attendance.jsp"><i class="fas fa-check-circle"></i> Attendance</a></li>
        <li><a href="../student/notes.jsp"><i class="fas fa-file-alt"></i> Notes</a></li>
        <li><a href="../student/tests.jsp"><i class="fas fa-pen"></i> Tests</a></li>
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
    <div class="container-fluid">
        <header class="dashboard-header text-center mb-5">
            <h1>Attendance Overview</h1>
            <div class="d-flex flex-column align-items-center">
                <h5 class="mt-3 mb-2 text-muted">Overall Attendance</h5>
                <div class="progress-circle" data-percentage="88">
                    <span>88%</span>
                </div>
            </div>
        </header>

        <!-- ===== COURSE-WISE ATTENDANCE ===== -->
        <section class="attendance-section">
            <h2 class="mb-4 text-center text-dark fw-semibold">Course-wise Attendance</h2>
            <div class="row g-4 justify-content-center">
                <div class="col-md-4 col-sm-6">
                    <div class="course-card">
                        <h3>Java Full Stack</h3>
                        <div class="progress-bar">
                            <div class="progress" style="width: 92%;"></div>
                        </div>
                        <p class="mt-2 fw-semibold">92% attended</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="course-card">
                        <h3>Python for Beginners</h3>
                        <div class="progress-bar">
                            <div class="progress" style="width: 85%;"></div>
                        </div>
                        <p class="mt-2 fw-semibold">85% attended</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="course-card">
                        <h3>Frontend Development</h3>
                        <div class="progress-bar">
                            <div class="progress" style="width: 78%;"></div>
                        </div>
                        <p class="mt-2 fw-semibold">78% attended</p>
                    </div>
                </div>
            </div>

            <div class="text-center">
                <a href="#" class="btn btn-primary mt-4"><i class="fas fa-download"></i> Download Attendance Report</a>
            </div>
        </section>
    </div>
</main>

<!-- ===== SCRIPTS ===== -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Animate progress bars
    window.addEventListener('load', () => {
        document.querySelectorAll('.progress').forEach(p => {
            const width = p.getAttribute('style').match(/\d+/)[0];
            p.style.width = '0';
            setTimeout(() => { p.style.width = width + '%'; }, 200);
        });
    });

    // Logout alert
    document.querySelector('.logout-btn').addEventListener('click', () => {
        alert('You have been logged out!');
        window.location.href = '../login.html';
    });
</script>
</body>
</html>
