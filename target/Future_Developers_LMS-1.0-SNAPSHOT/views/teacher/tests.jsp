<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Tests | Future Developers LMS</title>
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
        <h1>Manage Tests & Exams</h1>
        <div>
            <button class="btn-primary" id="addTestBtn"><i class="fas fa-plus"></i> Add Test</button>
        </div>
    </header>

    <!-- ===== TESTS TABLE ===== -->
    <!-- ===== TESTS TABLE ===== -->
    <section class="table-section">
        <div class="table-header">
            <h2>My Tests & Exams</h2>
            <div class="search-bar">
                <input type="text" placeholder="Search tests...">
                <button><i class="fas fa-search"></i></button>
            </div>
        </div>

        <table class="styled-table tests-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Course</th>
                <th>Title</th>
                <th>Type</th>
                <th>Date</th>
                <th>Duration</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>Java Full Stack</td>
                <td>OOP Concepts Quiz</td>
                <td>MCQ</td>
                <td>2025-10-20</td>
                <td>30 min</td>
                <td>
                    <button class="btn-small btn-edit"><i class="fas fa-edit"></i></button>
                    <button class="btn-small btn-delete"><i class="fas fa-trash-alt"></i></button>
                </td>
            </tr>
            <tr>
                <td>2</td>
                <td>Web Development</td>
                <td>HTML & CSS Test</td>
                <td>Subjective</td>
                <td>2025-10-25</td>
                <td>45 min</td>
                <td>
                    <button class="btn-small btn-edit"><i class="fas fa-edit"></i></button>
                    <button class="btn-small btn-delete"><i class="fas fa-trash-alt"></i></button>
                </td>
            </tr>
            </tbody>
        </table>
    </section>


    <!-- ===== ADD / EDIT TEST MODAL ===== -->
    <div class="modal" id="testModal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2 id="modalTitle">Add Test</h2>
            <form id="testForm">
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
                    <label>Test Title</label>
                    <input type="text" id="title" placeholder="Enter test title" required>
                </div>
                <div class="form-group">
                    <label>Test Type</label>
                    <select id="type" required>
                        <option value="">-- Select Type --</option>
                        <option value="MCQ">MCQ</option>
                        <option value="Subjective">Subjective</option>
                        <option value="Coding">Coding</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Date</label>
                    <input type="date" id="date" required>
                </div>
                <div class="form-group">
                    <label>Duration (minutes)</label>
                    <input type="number" id="duration" placeholder="Enter duration in minutes" required>
                </div>
                <button type="submit" class="btn-primary w-full">Save Test</button>
            </form>
        </div>
    </div>

</main>

<script>
    // ===== MODAL LOGIC =====
    const modal = document.getElementById('testModal');
    const addBtn = document.getElementById('addTestBtn');
    const closeBtn = modal.querySelector('.close');

    addBtn.onclick = () => { modal.style.display = 'block'; }
    closeBtn.onclick = () => { modal.style.display = 'none'; }
    window.onclick = (e) => { if(e.target == modal) modal.style.display = 'none'; }

    // ===== FORM SUBMISSION =====
    document.getElementById('testForm').onsubmit = function(e){
        e.preventDefault();
        alert("Test saved! (Connect this to TeacherTestServlet for CRUD)");
        modal.style.display = 'none';
        // TODO: Add AJAX / form submit to servlet
    }
</script>

</body>
</html>
