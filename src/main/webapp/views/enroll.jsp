<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Course Enrollment | Future Developers LMS</title>

    <!-- CSS -->
    <link rel="stylesheet" href="assets/css/style.css" />
    <link rel="stylesheet" href="assets/css/enroll.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a2c1234567.js" crossorigin="anonymous"></script>
</head>
<body>

<!-- ===== NAVBAR ===== -->
<header class="navbar">
    <div class="container nav-container">
        <img src="assets/images/logo.png" class="logo" alt="Logo">
        <nav>
            <ul class="nav-links">
                <li><a href="../index.jsp">Home</a></li>
                <li><a href="courses.jsp">Courses</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="auth/login.jsp" class="btn-login">Login</a></li>
                <li><a href="auth/register.jsp" class="btn-register">Register</a></li>
            </ul>
        </nav>
        <div class="menu-toggle"><i class="fas fa-bars"></i></div>
    </div>
</header>

<!-- ===== ENROLLMENT BANNER ===== -->
<section class="enroll-banner">
    <h1>Course Enrollment</h1>
    <p>Fill out the details below to confirm your enrollment.</p>
</section>

<!-- ===== ENROLLMENT FORM ===== -->
<section class="enroll-section">
    <div class="enroll-container">
        <form action="enrollServlet" method="post" class="enroll-form">
            <h2>Enrollment Form</h2>

            <div class="form-group">
                <label for="studentName"><i class="fas fa-user"></i> Student Name</label>
                <input type="text" id="studentName" name="studentName" placeholder="Enter your name" required>
            </div>

            <div class="form-group">
                <label for="email"><i class="fas fa-envelope"></i> Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
            </div>

            <div class="form-group">
                <label for="course"><i class="fas fa-book"></i> Selected Course</label>
                <select id="course" name="course" required>
                    <option value="">-- Select Course --</option>
                    <option value="Web Development">Web Development</option>
                    <option value="Java Full Stack">Java Full Stack</option>
                    <option value="Python Programming">Python Programming</option>
                    <option value="Data Science">Data Science</option>
                    <option value="AI & ML">AI & ML</option>
                </select>
            </div>

            <div class="form-group">
                <label for="duration"><i class="fas fa-clock"></i> Course Duration</label>
                <input type="text" id="duration" name="duration" placeholder="e.g. 3 Months" required>
            </div>

            <div class="form-group">
                <label for="year"><i class="fas fa-calendar-alt"></i> Academic Year</label>
                <input type="text" id="year" name="year" placeholder="e.g. 2025-2026" required>
            </div>

            <div class="form-group">
                <label for="comments"><i class="fas fa-comment"></i> Additional Notes (Optional)</label>
                <textarea id="comments" name="comments" rows="4" placeholder="Any specific preferences or questions?"></textarea>
            </div>

            <button type="submit" class="btn primary">Confirm Enrollment</button>
        </form>
    </div>
</section>

<!-- ===== FOOTER ===== -->
<footer>
    <div class="footer-container">
        <div class="footer-left">
            <img src="assets/images/logo.png" alt="Logo">
            <p>© 2025 Future Developers LMS. All rights reserved.</p>
        </div>
        <div class="footer-right">
            <a href="#"><i class="fab fa-linkedin"></i></a>
            <a href="#"><i class="fab fa-youtube"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
        </div>
    </div>
</footer>

<!-- JS -->
<script src="assets/js/main.js"></script>
<script src="assets/js/form.js"></script>
</body>
</html>
