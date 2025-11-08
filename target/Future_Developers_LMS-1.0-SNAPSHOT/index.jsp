<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Future Developers LMS | Learn. Build. Grow.</title>
    <link rel="stylesheet" href="views/assets/css/style.css" />
    <link rel="stylesheet" href="views/assets/css/responsive.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a2c1234567.js" crossorigin="anonymous"></script>
</head>
<body>

<!-- ===== NAVBAR ===== -->
<header class="navbar">
    <div class="container nav-container">
        <div class="nav-left">
            <img src="views/assets/images/FD.jpeg" class="logo" alt="Future Developers Logo">
            <h1>Future Developers</h1>
        </div>
        <nav>
            <ul class="nav-links">
                <li><a href="index.jsp" class="active">Home</a></li>
                <li><a href="views/courses.jsp">Courses</a></li>
                <li><a href="views/about.jsp">About</a></li>
                <li><a href="views/contact.jsp">Contact</a></li>
            </ul>
        </nav>
        <div class="nav-actions">
            <a href="views/auth/login.jsp" class="btn-outline">Login</a>
            <a href="views/auth/register.jsp" class="btn-primary">Get Started</a>
        </div>
        <div class="menu-toggle"><i class="fas fa-bars"></i></div>
    </div>
</header>

<!-- ===== HERO SECTION ===== -->
<section class="hero">
    <div class="container hero-container">
        <div class="hero-text">
            <h1>Learn. Build. <span>Grow Your Future</span></h1>
            <p>Empowering learners to master technology through engaging courses, real projects, and expert mentors.</p>
            <div class="hero-actions">
                <a href="views/courses.jsp" class="btn-primary">Explore Courses</a>
                <a href="views/auth/register.jsp" class="btn-outline">Join Now</a>
            </div>
            <div class="hero-stats">
                <div><h3>10K+</h3><p>Active Learners</p></div>
                <div><h3>300+</h3><p>Courses</p></div>
                <div><h3>95%</h3><p>Success Rate</p></div>
            </div>
        </div>
        <div class="hero-image">
            <img src="views/assets/images/main1.webp" alt="Learning Illustration">
        </div>
    </div>
</section>

<!-- ===== FEATURES ===== -->
<section class="features">
    <h2>Why Choose Future Developers?</h2>
    <div class="feature-grid">
        <div class="feature-card">
            <i class="fas fa-chalkboard-teacher"></i>
            <h3>Expert Instructors</h3>
            <p>Learn from experienced mentors who guide you
                step by step.</p>
        </div>
        <div class="feature-card">
            <i class="fas fa-laptop-code"></i>
            <h3>Practical Learning</h3>
            <p>Hands-on projects and coding practice for real-world skills.</p>
        </div>
        <div class="feature-card">
            <i class="fas fa-certificate"></i>
            <h3>Certifications</h3>
            <p>Get industry-recognized certificates upon course completion.</p>
        </div>
        <div class="feature-card">
            <i class="fas fa-clock"></i>
            <h3>Flexible Access</h3>
            <p>Learn anytime, anywhere, at your own pace.</p>
        </div>
    </div>
</section>

<!-- ===== POPULAR COURSES ===== -->
<section class="courses">
    <h2>Popular Courses</h2>
    <div class="course-grid">
        <div class="course-card">
            <img src="views/assets/images/java.jpg" alt="Java Full Stack">
            <h3>Java Full Stack Development</h3>
            <p>Master Java, JSP, Servlets, and Spring Boot with hands-on projects.</p>
            <a href="views/auth/register.jsp" class="btn-small">Enroll Now</a>
        </div>
        <div class="course-card">
            <img src="views/assets/images/wd.jpg" alt="Web Development">
            <h3>Frontend Web Development</h3>
            <p>Learn HTML, CSS, and JavaScript to build stunning websites.</p>
            <a href="views/auth/register.jsp" class="btn-small">Enroll Now</a>
        </div>
        <div class="course-card">
            <img src="views/assets/images/ml.jpg" alt="Python Programming">
            <h3>Python Programming</h3>
            <p>Build a strong foundation in Python and automation.</p>
            <a href="views/auth/register.jsp" class="btn-small">Enroll Now</a>
        </div>
    </div>
</section>

<!-- ===== CTA ===== -->
<section class="cta">
    <h2>Start Your Learning Journey Today 🚀</h2>
    <a href="views/auth/register.jsp" class="btn-primary">Get Started</a>
</section>

<!-- ===== FOOTER ===== -->
<!-- ===== FOOTER ===== -->
<footer>
    <div class="footer-container">

        <!-- Logo & About -->
        <div class="footer-column">
            <img src="views/assets/images/FD.jpeg" class="footer-logo" alt="FD Logo">
            <p>Future Developers LMS — Empowering learners everywhere with technology, projects, and expert guidance.</p>
        </div>

        <!-- Quick Links -->
        <div class="footer-column">
            <h4>Quick Links</h4>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="views/courses.jsp">Courses</a></li>
                <li><a href="views/about.jsp">About</a></li>
                <li><a href="views/contact.jsp">Contact</a></li>
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


<script src="views/assets/js/main.js"></script>
</body>
</html>
