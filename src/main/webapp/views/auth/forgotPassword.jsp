<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
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

        /* Container for the password reset form */
        .reset-container {
            background-color: #ffffff;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            box-sizing: border-box;
        }

        /* Form header */
        .reset-container h2 {
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

        /* Common styles for text inputs */
        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        /* Style for the submit button */
        .btn-submit {
            width: 100%;
            padding: 12px;
            background-color: #ffc107; /* A warning/attention color */
            color: #212529;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-submit:hover {
            background-color: #e0a800;
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
            background-color: #d4edda;
            color: #155724; /* For success messages */
        }

        .message.error {
            background-color: #f8d7da;
            color: #721c24; /* For error messages */
        }

        /* Container for the back link */
        .links {
            text-align: center;
            margin-top: 1.5rem;
        }

        .links a {
            color: #007bff;
            text-decoration: none;
        }

        .links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="reset-container">
    <h2>Reset Password</h2>

    <c:if test="${not empty requestScope.message}">
        <p class="message success">${requestScope.message}</p>
    </c:if>

    <c:if test="${not empty requestScope.errorMessage}">
        <p class="message error">${requestScope.errorMessage}</p>
    </c:if>

    <form action="${pageContext.request.contextPath}/auth" method="post">
        <input type="hidden" name="action" value="forgotPassword">

        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="new_password">New Password:</label>
            <input type="password" id="new_password" name="new_password" class="form-control" required>
        </div>

        <button type="submit" class="btn-submit">Reset Password</button>
    </form>

    <div class="links">
        <a href="${pageContext.request.contextPath}/views/auth/login.jsp">Back to Login</a>
    </div>
</div>

</body>
</html>