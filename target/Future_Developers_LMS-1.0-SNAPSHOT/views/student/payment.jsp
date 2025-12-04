<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.future_developers_lms.model.User, org.example.future_developers_lms.model.Course, org.example.future_developers_lms.service.CourseService" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"STUDENT".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect(request.getContextPath() + "/views/auth/login.jsp");
        return;
    }

    int courseId = Integer.parseInt(request.getParameter("courseId"));
    double amount = Double.parseDouble(request.getParameter("amount"));

    CourseService cs = new CourseService();
    Course course = cs.getCourseById(courseId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment | Future Developers LMS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap & Fonts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a2c1234567.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

    <style>
        body {
            display: flex;
            background: #f8fbfd;
            font-family: 'Poppins', sans-serif;
        }
        .sidebar {
            width: 250px;
            background: #1e90a1;
            color: white;
            height: 100vh;
            position: fixed;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .sidebar-header {
            text-align: center;
            padding: 1.5rem 0;
            border-bottom: 1px solid rgba(255,255,255,0.2);
        }
        .sidebar-menu {
            list-style: none;
            padding: 1rem;
        }
        .sidebar-menu li a {
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 10px 20px;
            border-radius: 8px;
            transition: background 0.3s;
        }
        .sidebar-menu li a:hover,
        .sidebar-menu li.active a {
            background: rgba(255,255,255,0.25);
        }
        .main-content {
            margin-left: 250px;
            width: calc(100% - 250px);
            padding: 2rem;
        }
        .payment-card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            padding: 30px;
            max-width: 600px;
            margin: auto;
            border-left: 5px solid #1e90a1;
        }
        .payment-card h3 {
            color: #1e90a1;
            font-weight: 600;
        }
        .btn-pay {
            background: #1e90a1;
            border: none;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: 500;
        }
        .btn-pay:hover { background: #177e8f; }
    </style>
</head>

<body>
<!-- Sidebar -->
<aside class="sidebar">
    <div class="sidebar-header">
        <img src="${pageContext.request.contextPath}/images/FD.jpeg" alt="Logo" width="70" style="border-radius:10px;">
        <h2>Future Developers</h2>
        <p>Welcome, <%= user.getFullName() %></p>
    </div>

    <ul class="sidebar-menu">
        <li><a href="${pageContext.request.contextPath}/student/dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="${pageContext.request.contextPath}/CourseServlet?action=all"><i class="fas fa-book"></i> Courses</a></li>
        <li><a href="${pageContext.request.contextPath}/CourseServlet?action=enrolled"><i class="fas fa-clipboard-list"></i> Enrolled</a></li>
        <li class="active"><a href="#"><i class="fas fa-wallet"></i> Payment</a></li>
    </ul>

    <div class="sidebar-footer text-center">
        <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
            <button type="submit" class="btn btn-light btn-sm mt-2"><i class="fas fa-sign-out-alt"></i> Logout</button>
        </form>
    </div>
</aside>

<!-- Main -->
<main class="main-content">
    <div class="payment-card">
        <h3>Confirm Your Payment</h3>
        <hr>

        <p><strong>Course:</strong> <%= course.getTitle() %></p>
        <p><strong>Category:</strong> <%= course.getCategory() %></p>
        <p><strong>Duration:</strong> <%= course.getDuration() %></p>
        <p><strong>Price:</strong> ₹<%= course.getPrice() %></p>
        <% if (course.getDiscountPrice() > 0) { %>
        <p><strong>Discounted Price:</strong> ₹<%= course.getDiscountPrice() %></p>
        <% } %>

        <form id="payment-form">
            <script src="https://checkout.razorpay.com/v1/checkout.js"
                    data-key="rzp_test_yourKeyId"
                    data-amount="<%= (int)(amount * 100) %>"
                    data-currency="INR"
                    data-name="Future Developers LMS"
                    data-description="Course Payment: <%= course.getTitle() %>"
                    data-image="${pageContext.request.contextPath}/images/FD.jpeg"
                    data-prefill.name="<%= user.getFullName() %>"
                    data-prefill.email="<%= user.getEmail() %>"
                    data-theme.color="#1e90a1">
            </script>
            <input type="hidden" name="hidden">
        </form>

    </div>
</main>
</body>
</html>
