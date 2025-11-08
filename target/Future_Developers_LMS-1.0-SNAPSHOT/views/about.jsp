<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>About | Future Developers LMS</title>
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
                <li><a href="courses.jsp">Courses</a></li>
                <li><a href="about.jsp" class="active">About</a></li>
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
<section class="hero" style="padding:60px 0;">
    <div class="container hero-container" style="gap:2rem;">
        <div class="hero-text">
            <h1>About <span>Future Developers</span></h1>
            <p>Future Developers LMS is dedicated to helping learners build practical tech skills with project-based courses, expert mentors, and a community-first approach. We combine industry-relevant curriculum with hands-on practice so students are job-ready.</p>
        </div>
        <div class="hero-image">
            <img src="assets/images/FD.jpeg" alt="About us image" style="max-width:360px;border-radius:12px;">
        </div>
    </div>
</section>

<!-- MISSION & VISION -->
<section class="features" style="padding:50px 20px;">
    <div class="container">
        <h2>Our Mission</h2>
        <p style="max-width:900px;margin:12px auto 28px;color:#444;">To empower a new generation of developers by providing accessible, practical and mentor-led learning experiences that align with industry needs.</p>

        <div class="feature-grid" style="margin-top:1.2rem;">
            <div class="feature-card">
                <i class="fas fa-users"></i>
                <h3>Community</h3>
                <p>Peer learning, study groups and mentorship to accelerate growth.</p>
            </div>
            <div class="feature-card">
                <i class="fas fa-tools"></i>
                <h3>Practical Projects</h3>
                <p>Real-world projects and portfolios you can show employers.</p>
            </div>
            <div class="feature-card">
                <i class="fas fa-briefcase"></i>
                <h3>Career Support</h3>
                <p>Interview prep, resume review and job guidance for students.</p>
            </div>
            <div class="feature-card">
                <i class="fas fa-globe"></i>
                <h3>Accessible</h3>
                <p>Flexible learning paths — self-paced and instructor-led options.</p>
            </div>
        </div>
    </div>
</section>

<!-- TEAM -->
<section style="padding:60px 20px;">
    <div class="container">
        <h2>Meet the Team</h2>
        <div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:1.5rem;margin-top:1rem;">
            <div class="feature-card" style="text-align:center;">
                <img src="assets/images/user.png" alt="Founder" style="width:96px;height:96px;border-radius:50%;margin-bottom:12px;">
                <h3>Aditya Chaudhari</h3>
                <p>Founder & CEO — Passionate about building developer careers.</p>
            </div>
            <div class="feature-card" style="text-align:center;">
                <img src="assets/images/teacher.png" alt="Head Mentor" style="width:96px;height:96px;border-radius:50%;margin-bottom:12px;">
                <h3>Priya Sharma</h3>
                <p>Head Mentor — 10+ yrs experience in full-stack development.</p>
            </div>
            <div class="feature-card" style="text-align:center;">
                <img src="assets/images/admin.png" alt="Head of Ops" style="width:96px;height:96px;border-radius:50%;margin-bottom:12px;">
                <h3>Amit Verma</h3>
                <p>Operations — Keeps courses and platform running smoothly.</p>
            </div>
        </div>
    </div>
</section>

<!-- CTA -->
<section class="cta" style="padding:40px 20px;">
    <div class="container">
        <h2>Ready to start? Join thousands of learners today 🚀</h2>
        <a href="auth/register.jsp" class="btn-primary">Get Started</a>
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
