<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <style>
        /* Basic styles for the entire page */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Container for the login form */
        .login-container {
            background-color: #ffffff;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            box-sizing: border-box;
        }

        /* Form header */
        .login-container h2 {
            text-align: center;
            color: #333;
            margin-bottom: 1.5rem;
        }

        /* Styling for each form group (label + input) */
        .form-group {
            margin-bottom: 1rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: bold;
        }

        /* Common styles for text inputs and select box */
        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box; /* Ensures padding doesn't affect width */
        }

        /* Style for the submit button */
        .btn-submit {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }

        /* Styles for displaying messages (success or error) */
        .message {
            text-align: center;
            padding: 10px;
            margin-bottom: 1rem;
            border-radius: 4px;
            font-weight: bold;
        }

        .message.success {
            background-color: #e6f7ff;
            color: #005f9e; /* Using request attribute 'message' for success */
        }

        .message.error {
            background-color: #ffebe6;
            color: #c00; /* Using request attribute 'errorMessage' for errors */
        }

        /* Container for extra links */
        .links {
            text-align: center;
            margin-top: 1.5rem;
        }

        .links a {
            color: #007bff;
            text-decoration: none;
            margin: 0 10px;
        }

        .links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h2>User Login</h2>

    <c:if test="${not empty requestScope.message}">
        <p class="message success">${requestScope.message}</p>
    </c:if>

    <c:if test="${not empty requestScope.errorMessage}">
        <p class="message error">${requestScope.errorMessage}</p>
    </c:if>

    <form action="${pageContext.request.contextPath}/auth" method="post">
        <input type="hidden" name="action" value="login">

        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="role">Role:</label>
            <select id="role" name="role" class="form-control" required>
                <option value="" disabled selected>Select Role</option>
                <option value="STUDENT">Student</option>
                <option value="TEACHER">Teacher</option>
                <option value="ADMIN">Admin</option>
            </select>
        </div>

        <button type="submit" class="btn-submit">Login</button>
    </form>

    <div class="links">
            <a href="${pageContext.request.contextPath}/views/auth/register.jsp">New User? Register</a>
            <a href="${pageContext.request.contextPath}/views/auth/forgotPassword.jsp">Forgot Password</a>
    </div>
</div>

</body>
</html>