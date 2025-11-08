<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password | Future Developers LMS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/css/responsive.css" />
</head>
<body class="auth-body">

<section class="auth-section">
    <div class="auth-box">
        <h2>Reset Password 🔐</h2>
        <p class="auth-subtitle">Enter your new password below</p>

        <c:if test="${not empty message}">
            <p class="message success">${message}</p>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <p class="message error">${errorMessage}</p>
        </c:if>

        <form action="${pageContext.request.contextPath}/auth" method="post" class="auth-form" onsubmit="return validatePasswords()">
            <input type="hidden" name="action" value="resetPassword">
            <input type="hidden" name="token" value="${param.token}">

            <div class="form-group">
                <label>New Password</label>
                <input type="password" id="password" name="password" placeholder="Enter new password" required>
            </div>

            <div class="form-group">
                <label>Confirm Password</label>
                <input type="password" id="confirmPassword" placeholder="Confirm new password" required>
            </div>

            <p id="passwordError" style="color:red; display:none;">Passwords do not match.</p>

            <button type="submit" class="btn-primary w-full">Update Password</button>
        </form>
    </div>
</section>

<script>
    function validatePasswords() {
        const p = document.getElementById("password").value;
        const c = document.getElementById("confirmPassword").value;
        if (p !== c) {
            document.getElementById("passwordError").style.display = "block";
            return false;
        }
        return true;
    }
</script>
</body>
</html>
