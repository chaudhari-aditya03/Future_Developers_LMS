<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Courses | Future Developers LMS</title>
    <link rel="stylesheet" href="assets/css/style.css" />
    <link rel="stylesheet" href="assets/css/responsive.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a2c1234567.js" crossorigin="anonymous"></script>
</head>
<body>

<!-- NAVBAR -->
<header class="navbar">
    <div class="container nav-container">
        <div class="nav-left">
            <img src="assets/images/FD.jpeg" class="logo" alt="Future Developers Logo">
            <h1>Future Developers</h1>
        </div>
        <nav>
            <ul class="nav-links">
                <li><a href="../index.jsp">Home</a></li>
                <li><a href="courses.jsp" class="active">Courses</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a href="contact.jsp">Contact</a></li>
            </ul>
        </nav>
        <div class="nav-actions">
            <a href="auth/login.jsp" class="btn-outline">Login</a>
            <a href="auth/register.jsp" class="btn-primary">Get Started</a>
        </div>
        <div class="menu-toggle"><i class="fas fa-bars"></i></div>
    </div>
</header>

<!-- HERO -->
<section class="hero" style="padding:40px 0;">
    <div class="container hero-container" style="gap:1.5rem;">
        <div class="hero-text">
            <h1>Our Courses</h1>
            <p>Hands-on, industry-aligned courses designed to make you job-ready. Pick a track and start building real projects.</p>
        </div>
        <div class="hero-image">
            <img src="assets/images/courses.jpg" alt="Courses" style="max-width:300px;border-radius:12px;">
        </div>
    </div>
</section>

<!-- COURSES GRID -->
<section class="courses">
    <div class="container">
        <h2>All Courses</h2>
        <div class="course-grid" style="margin-top:1rem;">
            <!-- Course card -->
            <div class="course-card">
                <img src="assets/images/java.jpg" alt="Java Full Stack">
                <div style="padding:1rem;">
                    <h3>Java Full Stack Development</h3>
                    <p>Master Java, Servlets, JSP and Spring Boot. Build REST APIs and full-stack apps.</p>
                    <p><strong>Duration:</strong> 6 months • <strong>Level:</strong> Intermediate</p>
                    <a href="auth/register.jsp" class="btn-small">Enroll Now</a>
                </div>
            </div>

            <div class="course-card">
                <img src="assets/images/wd.jpg" alt="Frontend">
                <div style="padding:1rem;">
                    <h3>Frontend Web Development</h3>
                    <p>HTML, CSS, JavaScript + modern frameworks to build responsive UI.</p>
                    <p><strong>Duration:</strong> 4 months • <strong>Level:</strong> Beginner</p>
                    <a href="auth/register.jsp" class="btn-small">Enroll Now</a>
                </div>
            </div>

            <div class="course-card">
                <img src="assets/images/ml.jpg" alt="Python">
                <div style="padding:1rem;">
                    <h3>Python Programming</h3>
                    <p>Python fundamentals, automation, scripts and data handling.</p>
                    <p><strong>Duration:</strong> 3 months • <strong>Level:</strong> Beginner</p>
                    <a href="auth/register.jsp" class="btn-small">Enroll Now</a>
                </div>
            </div>

            <!-- Add more cards as needed -->
        </div>
    </div>
</section>

<!-- CTA -->
<section class="cta" style="padding:40px 20px;">
    <div class="container">
        <h2>Want a custom corporate training plan?</h2>
        <a href="contact.jsp" class="btn-primary">Contact Sales</a>
    </div>
</section>

<!-- FOOTER -->
<!-- ===== FOOTER ===== -->
<footer>
    <div class="footer-container">

        <!-- Logo & About -->
        <div class="footer-column">
            <img src="assets/images/FD.jpeg" class="footer-logo" alt="FD Logo">
            <p>Future Developers LMS — Empowering learners everywhere with technology, projects, and expert guidance.</p>
        </div>

        <!-- Quick Links -->
        <div class="footer-column">
            <h4>Quick Links</h4>
            <ul>
                <li><a href="../index.jsp">Home</a></li>
                <li><a href="courses.jsp">Courses</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a href="contact.jsp">Contact</a></li>
            </ul>
        </div>

        <!-- Social Links -->
        <div class="footer-column">
            <h4>Follow Us</h4>
            <div class="social-links">
                <a href="#"><i class="fab fa-linkedin"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-facebook-f"></i></a>
            </div>
        </div>

    </div>

    <div class="footer-bottom">
        <p>© 2025 Future Developers LMS. All rights reserved.</p>
    </div>
</footer>


<script src="assets/js/main.js"></script>
</body>
</html>
