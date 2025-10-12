
<!DOCTYPE html>
<html>
<head><title>Register</title></head>
<body>
<h2>User Registration</h2>
<form action="${pageContext.request.contextPath}/auth" method="post">
    <input type="hidden" name="action" value="register">

    Full Name: <input type="text" name="fullName" required><br>
    Email: <input type="email" name="email" required><br>
    Password: <input type="password" name="password" required><br>
    Role:
    <select name="role" required>
        <option value="">Select Role</option>
        <option value="STUDENT">Student</option>
        <option value="TEACHER">Teacher</option>
        <option value="ADMIN">Admin</option>
    </select><br>

    <button type="submit">Register</button>
</form>

<p style="color:red;">${message}</p>
<a href="login.jsp">Already have an account? Login</a>
</body>
</html>
