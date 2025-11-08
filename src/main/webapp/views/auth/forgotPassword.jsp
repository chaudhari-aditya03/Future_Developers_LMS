<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Forgot Password | Future Developers LMS</title>

    <!-- Shared Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/css/responsive.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
</head>

<body class="auth-body">

<!-- ===== PASSWORD RESET FORM ===== -->
<section class="auth-section">
    <div class="auth-box">
        <h2>Reset Your Password 🔐</h2>
        <p class="auth-subtitle">Enter your registered email and new password</p>

        <!-- Display Messages -->
        <c:if test="${not empty message}">
            <p class="message success" style="color: green;">${message}</p>
        </c:if>

        <c:if test="${not empty errorMessage}">
            <p class="message error" style="color: red;">${errorMessage}</p>
        </c:if>

        <!-- ===== FORM ===== -->
        <form id="forgotForm" action="${pageContext.request.contextPath}/auth" method="post" class="auth-form" onsubmit="return validatePasswords()">
            <input type="hidden" name="action" value="forgotPassword">

            <div class="form-group">
                <label>Email Address</label>
                <input type="email" id="email" name="email" placeholder="Enter your registered email" required>
            </div>

            <div class="form-group">
                <label>New Password</label>
                <input type="password" id="new_password" name="new_password" placeholder="Create new password" required>
            </div>

            <div class="form-group">
                <label>Confirm Password</label>
                <input type="password" id="confirm_password" placeholder="Confirm new password" required>
            </div>

            <p id="passwordError" style="color:red; display:none;">Passwords do not match.</p>

            <button type="submit" class="btn-primary w-full">Reset Password</button>
        </form>

        <p class="switch-link">
            <a href="${pageContext.request.contextPath}/views/auth/login.jsp">⬅ Back to Login</a>
        </p>
    </div>
</section>

<!-- ===== PASSWORD MATCH VALIDATION ===== -->
<script>
    function validatePasswords() {
        const pass = document.getElementById('new_password').value.trim();
        const confirm = document.getElementById('confirm_password').value.trim();
        const error = document.getElementById('passwordError');

        if (pass !== confirm) {
            error.style.display = 'block';
            return false;
        } else {
            error.style.display = 'none';
            return true;
        }
    }
</script>

</body>
</html>
