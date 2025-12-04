<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.future_developers_lms.model.Course" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    String courseIdParam = request.getParameter("courseId");
    int courseId = courseIdParam != null ? Integer.parseInt(courseIdParam) : 0;

    // Ideally fetch course details from DB via CourseService
    org.example.future_developers_lms.service.CourseService cs = new org.example.future_developers_lms.service.CourseService();
    Course course = cs.getCourseById(courseId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment | Future Developers LMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow p-4">
        <h2 class="text-center text-primary mb-4">Course Payment</h2>

        <h4>${course.title}</h4>
        <p><strong>Original Price:</strong> ₹${course.price}</p>
        <c:if test="${course.discountPrice > 0}">
            <p><strong>Discount Price:</strong> ₹${course.discountPrice}</p>
        </c:if>

        <form action="${pageContext.request.contextPath}/PaymentServlet" method="post" class="mt-4">
            <input type="hidden" name="courseId" value="${course.courseId}">
            <input type="hidden" name="amount" value="${course.discountPrice > 0 ? course.discountPrice : course.price}">

            <div class="mb-3">
                <label for="cardNumber" class="form-label">Card Number</label>
                <input type="text" id="cardNumber" name="cardNumber" class="form-control" required>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="expiry" class="form-label">Expiry Date</label>
                    <input type="text" id="expiry" name="expiry" class="form-control" placeholder="MM/YY" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="cvv" class="form-label">CVV</label>
                    <input type="password" id="cvv" name="cvv" class="form-control" required>
                </div>
            </div>

            <button type="submit" class="btn btn-primary w-100">Complete Payment</button>
        </form>
    </div>
</div>

</body>
</html>
