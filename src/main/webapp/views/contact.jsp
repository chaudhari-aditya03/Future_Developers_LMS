<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Contact | Future Developers LMS</title>
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
                <li><a href="about.jsp">About</a></li>
                <li><a href="contact.jsp" class="active">Contact</a></li>
            </ul>
        </nav>
        <div class="nav-actions">
            <a href="auth/login.jsp" class="btn-outline">Login</a>
            <a href="auth/register.jsp" class="btn-primary">Get Started</a>
        </div>
        <div class="menu-toggle"><i class="fas fa-bars"></i></div>
    </div>
</header>

<!-- CONTACT HERO -->
<section class="hero" style="padding:60px 0;">
    <div class="container hero-container">
        <div class="hero-text">
            <h1>Contact Us</h1>
            <p>Have a question or need help? Send us a message and our team will get back to you within 24 hours.</p>
        </div>
        <div class="hero-image">
            <img src="assets/images/main.jpg" alt="Contact" style="max-width:300px;border-radius:12px;">
        </div>
    </div>
</section>

<!-- CONTACT FORM -->
<section style="padding:40px 20px;">
    <div class="container" style="max-width:980px;margin:auto;">
        <div style="display:grid;grid-template-columns:1fr 1fr;gap:2rem;">
            <div style="background:white;padding:1.5rem;border-radius:12px;box-shadow:0 6px 20px rgba(0,0,0,0.06);">
                <h3>Get in touch</h3>
                <p>General inquiries, partnerships or support.</p>
                <ul style="list-style:none;padding:0;margin-top:1rem;color:#444;">
                    <li><strong>Email:</strong> support@futuredevelopers.com</li>
                    <li style="margin-top:0.5rem;"><strong>Phone:</strong> +91 98765 43210</li>
                    <li style="margin-top:0.5rem;"><strong>Address:</strong> 123 Tech Street, Bengaluru, India</li>
                </ul>
            </div>

            <div style="background:white;padding:1.5rem;border-radius:12px;box-shadow:0 6px 20px rgba(0,0,0,0.06);">
                <h3>Send a Message</h3>
                <form id="contactForm">
                    <div class="form-group" style="margin-bottom:0.8rem;">
                        <label>Name</label>
                        <input type="text" id="name" placeholder="Your name" required style="width:100%;padding:0.6rem;border-radius:8px;border:1px solid #ccc;">
                    </div>
                    <div class="form-group" style="margin-bottom:0.8rem;">
                        <label>Email</label>
                        <input type="email" id="email" placeholder="Your email" required style="width:100%;padding:0.6rem;border-radius:8px;border:1px solid #ccc;">
                    </div>
                    <div class="form-group" style="margin-bottom:0.8rem;">
                        <label>Message</label>
                        <textarea id="message" rows="5" placeholder="How can we help?" required style="width:100%;padding:0.6rem;border-radius:8px;border:1px solid #ccc;"></textarea>
                    </div>
                    <button type="submit" class="btn-primary">Send Message</button>
                </form>
            </div>
        </div>
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


<script>
    // simple contact form mock submission
    document.getElementById('contactForm').addEventListener('submit', function(e){
        e.preventDefault();
        alert('Thanks — your message has been sent. We will contact you shortly.');
        this.reset();
    });
</script>

<script src="assets/js/main.js"></script>
</body>
</html>
