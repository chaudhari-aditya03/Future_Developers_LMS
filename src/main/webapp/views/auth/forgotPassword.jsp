<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 10/12/2025
  Time: 12:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forgot Password</title>
</head>
<body>

<h1>Forgot Password</h1>

<% String msg = (String) request.getAttribute("message"); %>
<% if (msg != null) { %>
<p style="color:blue;"><%= msg %></p>
<% } %>

<% String error = (String) request.getAttribute("error"); %>
<% if (error != null) { %>
<p style="color:red;"><%= error %></p>
<% } %>

<form action="<%=request.getContextPath()%>/auth" method="post">
    <input type="hidden" name="action" value="forgotPassword">
    <label>Email:</label>
    <input type="email" name="email" required><br><br>
    <label>New Password:</label>
    <input type="password" name="new_password" required><br><br>
    <button type="submit">Reset Password</button>
</form>

<p><a href="login.jsp">Back to Login</a></p>

</body>
</html>

