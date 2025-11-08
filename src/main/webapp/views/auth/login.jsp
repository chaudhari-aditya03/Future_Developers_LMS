<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login | Future Developers LMS</title>

    <!-- Stylesheets -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/css/responsive.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body class="auth-body">

<!-- ===== LOGIN FORM ===== -->
<section class="auth-section">
    <div class="auth-box">
        <h2>Welcome Back</h2>
        <p class="auth-subtitle">Login to access your personalized dashboard</p>

        <!-- Success or Error Messages -->
        <c:if test="${not empty message}">
            <p class="message success" style="color: red">${message}</p>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <p class="message error" style="color: red">${errorMessage}</p>
        </c:if>

        <!-- ===== LOGIN FORM ===== -->
        <form action="${pageContext.request.contextPath}/auth" method="post" class="auth-form">
            <input type="hidden" name="action" value="login">

            <div class="form-group">
                <label for="role">Select Role</label>
                <select id="role" name="role" required>
                    <option value="">-- Choose your role --</option>
                    <option value="ADMIN">Admin</option>
                    <option value="TEACHER">Teacher</option>
                    <option value="STUDENT">Student</option>
                </select>
            </div>

            <div class="form-group">
                <label>Email Address</label>
                <input type="email" name="email" placeholder="Enter your email" required>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" placeholder="Enter your password" required>
            </div>

            <button type="submit" class="btn-primary w-full">Login</button>
        </form>

        <p class="switch-link">
            Don’t have an account?
            <a href="${pageContext.request.contextPath}/views/auth/register.jsp">Register here</a>
        </p>

        <p class="switch-link">
            Forgot your password?
            <a href="${pageContext.request.contextPath}/views/auth/forgotPassword.jsp">Reset it</a>
        </p>
    </div>
</section>

</body>
</html>
