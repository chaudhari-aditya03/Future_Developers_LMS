<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, org.example.future_developers_lms.model.Course, org.example.future_developers_lms.model.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"STUDENT".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect(request.getContextPath() + "/views/auth/login.jsp");
        return;
    }

    List<Course> allCourses = (List<Course>) request.getAttribute("allCourses");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Available Courses | Future Developers LMS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap + Fonts -->
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
        .course-card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
            padding: 20px;
            margin-bottom: 20px;
            border-left: 5px solid #1e90a1;
        }
        .course-card h3 {
            color: #1e90a1;
        }
        .btn-enroll {
            background: #1e90a1;
            border: none;
            color: white;
            padding: 8px 16px;
            border-radius: 6px;
            font-weight: 500;
        }
        .btn-enroll:hover {
            background: #177e8f;
        }
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
        <li><a href="${pageContext.request.contextPath}/student/profile.jsp"><i class="fas fa-user"></i> Profile</a></li>
        <li class="active"><a href="${pageContext.request.contextPath}/CourseServlet?action=all"><i class="fas fa-book"></i> Courses</a></li>
        <li><a href="${pageContext.request.contextPath}/student/lectures.jsp"><i class="fas fa-video"></i> Lectures</a></li>
        <li><a href="${pageContext.request.contextPath}/student/attendance.jsp"><i class="fas fa-check-circle"></i> Attendance</a></li>
        <li><a href="${pageContext.request.contextPath}/student/notes.jsp"><i class="fas fa-file-alt"></i> Notes</a></li>
        <li><a href="${pageContext.request.contextPath}/student/tests.jsp"><i class="fas fa-pen"></i> Tests</a></li>
        <li><a href="${pageContext.request.contextPath}/student/payments.jsp"><i class="fas fa-wallet"></i> Payments</a></li>
        <li><a href="${pageContext.request.contextPath}/student/feedback.jsp"><i class="fas fa-comment-dots"></i> Feedback</a></li>
    </ul>

    <div class="sidebar-footer text-center">
        <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
            <button type="submit" class="btn btn-light btn-sm mt-2"><i class="fas fa-sign-out-alt"></i> Logout</button>
        </form>
    </div>
</aside>

<!-- Main -->
<main class="main-content">
    <h2 class="mb-4 text-primary">Available Courses</h2>

    <c:choose>
        <c:when test="${not empty allCourses}">
            <c:forEach var="course" items="${allCourses}">
                <div class="course-card">
                    <h3>${course.title}</h3>
                    <p><strong>Category:</strong> ${course.category}</p>
                    <p><strong>Duration:</strong> ${course.duration}</p>
                    <p><strong>Level:</strong> ${course.level}</p>
                    <p><strong>Price:</strong> ₹${course.price}</p>

                    <c:if test="${course.discountPrice > 0}">
                        <p><strong>Discounted Price:</strong> ₹${course.discountPrice}</p>
                    </c:if>

                    <p>${course.description}</p>

                    <c:choose>
                        <c:when test="${course.price == 0}">
                            <%-- Free course enrollment --%>
                            <form action="${pageContext.request.contextPath}/CourseServlet" method="post">
                                <input type="hidden" name="action" value="enroll">
                                <input type="hidden" name="courseId" value="${course.courseId}">
                                <button type="submit" class="btn-enroll">Enroll for Free</button>
                            </form>
                        </c:when>

                        <c:otherwise>
                            <%-- Paid course redirection to payment page --%>
                            <form action="${pageContext.request.contextPath}/views/student/payment.jsp" method="get">
                                <input type="hidden" name="courseId" value="${course.courseId}">
                                <input type="hidden" name="amount" value="${course.discountPrice > 0 ? course.discountPrice : course.price}">
                                <button type="submit" class="btn-enroll">Buy Now</button>
                            </form>
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p>No courses available right now.</p>
        </c:otherwise>
    </c:choose>
</main>
</body>
</html>
