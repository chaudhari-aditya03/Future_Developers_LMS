<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #007bff;
            color: white;
            padding: 1rem;
            text-align: center;
        }
        .container {
            padding: 2rem;
        }
        .section {
            background-color: #fff;
            padding: 1rem;
            margin-bottom: 1rem;
            border-radius: 6px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h2 {
            margin-top: 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 0.5rem;
        }
        th, td {
            padding: 8px 12px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f4f4f4;
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<header>
    <h1>Welcome, ${sessionScope.user.fullName}</h1>
    <p><a href="${pageContext.request.contextPath}/views/auth/logout.jsp.jsp">Logout</a></p>
</header>

<div class="container">

    <!-- Courses Section -->
    <div class="section">
        <h2>Enrolled Courses</h2>
        <c:if test="${empty courses}">
            <p>No courses enrolled yet.</p>
        </c:if>
        <c:if test="${not empty courses}">
            <table>
                <tr>
                    <th>Course Name</th>
                    <th>Description</th>
                </tr>
                <c:forEach var="course" items="${courses}">
                    <tr>
                        <td>${course.courseName}</td>
                        <td>${course.description}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </div>

    <!-- Attendance Section -->
    <div class="section">
        <h2>Attendance</h2>
        <c:if test="${empty attendanceMap}">
            <p>No attendance records yet.</p>
        </c:if>
        <c:if test="${not empty attendanceMap}">
            <table>
                <tr>
                    <th>Course Name</th>
                    <th>Attendance %</th>
                </tr>
                <c:forEach var="course" items="${courses}">
                    <tr>
                        <td>${course.courseName}</td>
                        <td>${attendanceMap[course.courseId]}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </div>

    <!-- Tests Section -->
    <div class="section">
        <h2>Tests & Results</h2>
        <c:if test="${empty testResults}">
            <p>No test results yet.</p>
        </c:if>
        <c:if test="${not empty testResults}">
            <table>
                <tr>
                    <th>Test Name</th>
                    <th>Score</th>
                    <th>Status</th>
                </tr>
                <c:forEach var="test" items="${testResults}">
                    <tr>
                        <td>${test.testName}</td>
                        <td>${test.score}</td>
                        <td>${test.status}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </div>

    <!-- Lectures Section -->
    <div class="section">
        <h2>Lectures</h2>
        <c:if test="${empty lectures}">
            <p>No lectures available.</p>
        </c:if>
        <c:if test="${not empty lectures}">
            <table>
                <tr>
                    <th>Title</th>
                    <th>Date</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="lecture" items="${lectures}">
                    <tr>
                        <td>${lecture.title}</td>
                        <td>${lecture.date}</td>
                        <td><a href="${lecture.videoLink}">Watch</a></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </div>

    <!-- Notes Section -->
    <div class="section">
        <h2>Notes</h2>
        <c:if test="${empty notes}">
            <p>No notes available.</p>
        </c:if>
        <c:if test="${not empty notes}">
            <table>
                <tr>
                    <th>Title</th>
                    <th>Download</th>
                </tr>
                <c:forEach var="note" items="${notes}">
                    <tr>
                        <td>${note.title}</td>
                        <td><a href="${note.filePath}">Download</a></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </div>

</div>

</body>
</html>
