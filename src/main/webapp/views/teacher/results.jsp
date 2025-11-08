<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Results | Future Developers LMS</title>
    <link rel="stylesheet" href="../css/style.css" />
    <link rel="stylesheet" href="../css/dashboard.css" />
    <script src="https://kit.fontawesome.com/a2c1234567.js" crossorigin="anonymous"></script>
</head>
<body>

<!-- ===== SIDEBAR ===== -->
<aside class="sidebar">
    <div class="sidebar-header">
        <img src="../images/FD.jpeg" alt="Logo" class="sidebar-logo">
        <h2>Future Developers</h2>
    </div>
    <ul class="sidebar-menu">
        <li class="active"><a href="teacher-dashboard.html"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="courses.html"><i class="fas fa-book"></i> My Courses</a></li>
        <li><a href="lectures.html"><i class="fas fa-video"></i> Lectures</a></li>
        <li><a href="notes.html"><i class="fas fa-file-alt"></i> Notes</a></li>
        <li><a href="tests.html"><i class="fas fa-pen"></i> Tests</a></li>
        <li><a href="results.html"><i class="fas fa-chart-bar"></i> Results</a></li>
        <li><a href="attendance.html"><i class="fas fa-check-circle"></i> Attendance</a></li>
        <li><a href="reports.html"><i class="fas fa-chart-line"></i> Reports</a></li>
        <li><a href="profile.html"><i class="fas fa-user-cog"></i> Profile</a></li>
    </ul>
</aside>

<!-- ===== MAIN CONTENT ===== -->
<main class="main-content">
    <header class="dashboard-header">
        <h1>Manage Student Results</h1>
        <div>
            <button class="btn-primary" id="addResultBtn"><i class="fas fa-plus"></i> Add Result</button>
        </div>
    </header>

    <!-- ===== RESULTS TABLE ===== -->
    <!-- ===== RESULTS TABLE ===== -->
    <section class="table-section">
        <div class="table-header">
            <h2>Student Results</h2>
            <div class="search-bar">
                <input type="text" placeholder="Search results...">
                <button><i class="fas fa-search"></i></button>
            </div>
        </div>

        <table class="styled-table results-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Student Name</th>
                <th>Course</th>
                <th>Test</th>
                <th>Score</th>
                <th>Grade</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>John Doe</td>
                <td>Java Full Stack</td>
                <td>OOP Quiz</td>
                <td>28/30</td>
                <td>A+</td>
                <td>
                    <button class="btn-small btn-edit"><i class="fas fa-edit"></i></button>
                    <button class="btn-small btn-delete"><i class="fas fa-trash-alt"></i></button>
                </td>
            </tr>
            <tr>
                <td>2</td>
                <td>Jane Smith</td>
                <td>Web Development</td>
                <td>HTML & CSS Test</td>
                <td>40/50</td>
                <td>B+</td>
                <td>
                    <button class="btn-small btn-edit"><i class="fas fa-edit"></i></button>
                    <button class="btn-small btn-delete"><i class="fas fa-trash-alt"></i></button>
                </td>
            </tr>
            </tbody>
        </table>
    </section>


    <!-- ===== ADD / EDIT RESULT MODAL ===== -->
    <div class="modal" id="resultModal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2 id="modalTitle">Add Result</h2>
            <form id="resultForm">
                <div class="form-group">
                    <label>Student Name</label>
                    <input type="text" id="studentName" placeholder="Enter student name" required>
                </div>
                <div class="form-group">
                    <label>Course</label>
                    <select id="course" required>
                        <option value="">-- Select Course --</option>
                        <option value="Java Full Stack">Java Full Stack</option>
                        <option value="Web Development">Web Development</option>
                        <option value="Python Programming">Python Programming</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Test</label>
                    <input type="text" id="test" placeholder="Enter test title" required>
                </div>
                <div class="form-group">
                    <label>Score</label>
                    <input type="text" id="score" placeholder="e.g., 28/30" required>
                </div>
                <div class="form-group">
                    <label>Grade</label>
                    <input type="text" id="grade" placeholder="e.g., A+" required>
                </div>
                <button type="submit" class="btn-primary w-full">Save Result</button>
            </form>
        </div>
    </div>

</main>

<script>
    // ===== MODAL LOGIC =====
    const modal = document.getElementById('resultModal');
    const addBtn = document.getElementById('addResultBtn');
    const closeBtn = modal.querySelector('.close');

    addBtn.onclick = () => { modal.style.display = 'block'; }
    closeBtn.onclick = () => { modal.style.display = 'none'; }
    window.onclick = (e) => { if(e.target == modal) modal.style.display = 'none'; }

    // ===== FORM SUBMISSION =====
    document.getElementById('resultForm').onsubmit = function(e){
        e.preventDefault();
        alert("Result saved! (Connect this to TeacherResultServlet for CRUD)");
        modal.style.display = 'none';
        // TODO: Add AJAX / form submit to servlet
    }
</script>

</body>
</html>
