<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Learning Management System - Home</title>
    <style>
        /* Basic styles for the entire page */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #f4f7f6;
            color: #333;
            line-height: 1.6;
        }

        /* Main container to center content */
        .container {
            width: 80%;
            max-width: 1200px;
            margin: auto;
            overflow: hidden;
            padding: 0 2rem;
        }

        /* Header section */
        .main-header {
            background: #ffffff;
            padding: 1rem 0;
            border-bottom: 2px solid #007bff;
            text-align: center;
        }

        .main-header h1 {
            margin: 0;
            color: #007bff;
            font-size: 2.5rem;
        }

        /* Hero section for the main welcome message */
        .hero {
            background: #007bff;
            color: #ffffff;
            padding: 4rem 0;
            text-align: center;
        }

        .hero h2 {
            font-size: 3rem;
            margin-bottom: 1rem;
        }

        .hero p {
            font-size: 1.2rem;
        }

        /* Main content sections */
        .content-section {
            padding: 3rem 0;
            text-align: center;
        }

        .content-section h2 {
            font-size: 2rem;
            margin-bottom: 2rem;
            color: #333;
        }

        /* Features grid */
        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            text-align: left;
        }

        .feature-card {
            background: #ffffff;
            padding: 1.5rem;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .feature-card h3 {
            margin-top: 0;
            color: #007bff;
        }

        /* Call-to-action navigation buttons */
        .cta-buttons {
            margin-top: 2rem;
        }

        .btn {
            display: inline-block;
            background: #28a745;
            color: #fff;
            padding: 12px 25px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 1.1rem;
            margin: 0 10px;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background: #218838;
        }

        .btn-login {
            background: #007bff;
        }

        .btn-login:hover {
            background: #0056b3;
        }

        /* Footer */
        .main-footer {
            background: #333;
            color: #fff;
            text-align: center;
            padding: 1.5rem 0;
            margin-top: 2rem;
        }

    </style>
</head>
<body>

<header class="main-header">
    <div class="container">
        <h1>Future Developers LMS</h1>
    </div>
</header>

<section class="hero">
    <div class="container">
        <h2>Empowering the Next Generation of Developers</h2>
        <p>A seamless platform for learning, teaching, and managing educational content.</p>
    </div>
</section>

<main class="container">
    <section class="content-section">
        <h2>Core Features</h2>
        <div class="features-grid">
            <div class="feature-card">
                <h3>Unified Access</h3>
                <p>Dedicated portals and features for Students, Teachers, and Administrators.</p>
            </div>
            <div class="feature-card">
                <h3>Comprehensive Management</h3>
                <p>Easily manage courses, notes, assessments, and student attendance.</p>
            </div>
            <div class="feature-card">
                <h3>Insightful Analytics</h3>
                <p>Track student progress with a powerful dashboard and analytics tools.</p>
            </div>
        </div>

        <div class="cta-buttons">
            <a href="${pageContext.request.contextPath}/views/auth/login.jsp" class="btn btn-login">Login</a>
            <a href="${pageContext.request.contextPath}/views/auth/register.jsp" class="btn">Register</a>
        </div>
    </section>
</main>

<footer class="main-footer">
    <p>&copy; 2025 Future Developers LMS | All Rights Reserved</p>
</footer>

</body>
</html>