<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register | Future Developers LMS</title>

    <!-- Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/css/responsive.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body class="auth-body">

<!-- ===== REGISTER FORM ===== -->
<section class="auth-section">
    <div class="auth-box">
        <h2>Create Your Account </h2>
        <p class="auth-subtitle">Join our community of learners today</p>

        <!-- Display Messages -->
        <c:if test="${not empty message}">
            <p class="message success" style="color: red">${message}</p>
        </c:if>

        <!-- ===== REGISTRATION FORM ===== -->
        <form id="registerForm" action="${pageContext.request.contextPath}/auth" method="post" class="auth-form" onsubmit="return validatePasswords()">
            <!-- Hidden action for servlet -->
            <input type="hidden" name="action" value="register">

            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="fullName" placeholder="Enter your full name" required>
            </div>

            <div class="form-group">
                <label>Email Address</label>
                <input type="email" name="email" placeholder="Enter your email" required>
            </div>

            <div class="form-group">
                <label>Role</label>
                <select name="role" required>
                    <option value="">-- Select your role --</option>
                    <option value="STUDENT">Student</option>
                    <option value="TEACHER">Teacher</option>
                </select>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" id="password" name="password" placeholder="Create password" required>
            </div>

            <div class="form-group">
                <label>Confirm Password</label>
                <input type="password" id="confirmPassword" placeholder="Confirm password" required>
            </div>

            <p id="passwordError" style="color:red; display:none;">Passwords do not match.</p>

            <button type="submit" class="btn-primary w-full">Register</button>
        </form>

        <p class="switch-link">
            Already have an account?
            <a href="${pageContext.request.contextPath}/views/auth/login.jsp">Login here</a>
        </p>
    </div>
</section>

<!-- ===== JS PASSWORD VALIDATION ===== -->
<script>
    function validatePasswords() {
        const pass = document.getElementById('password').value.trim();
        const confirmPass = document.getElementById('confirmPassword').value.trim();
        const errorMsg = document.getElementById('passwordError');

        if (pass !== confirmPass) {
            errorMsg.style.display = 'block';
            return false; // stop form submission
        } else {
            errorMsg.style.display = 'none';
            return true; // allow submission
        }
    }
</script>

</body>
</html>
