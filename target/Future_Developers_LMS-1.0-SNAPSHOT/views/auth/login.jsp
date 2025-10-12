<!DOCTYPE html>
<html>
<head><title>Login</title></head>
<body>
<h2>User Login</h2>
<form action="${pageContext.request.contextPath}/auth" method="post">
    <input type="hidden" name="action" value="login">

    Email: <input type="email" name="email" required><br>
    Password: <input type="password" name="password" required><br>
    Role:
    <select name="role" required>
        <option value="">Select Role</option>
        <option value="STUDENT">Student</option>
        <option value="TEACHER">Teacher</option>
        <option value="ADMIN">Admin</option>
    </select><br>

    <button type="submit">Login</button>
</form>

<p style="color:red;">${message}</p>
<a href="../auth/register.jsp">New User? Register</a>
<a href="../auth/forgotPassword.jsp">Forgot Password</a>
</body>
</html>
