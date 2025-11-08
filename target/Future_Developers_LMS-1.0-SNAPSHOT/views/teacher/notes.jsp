<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Teacher Notes | Future Developers LMS</title>
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
        <h1>Teacher Notes Management</h1>
        <div>
            <button class="btn-primary" id="addNoteBtn"><i class="fas fa-plus"></i> Add Note</button>
        </div>
    </header>

    <!-- ===== NOTES TABLE ===== -->
    <!-- ===== NOTES TABLE ===== -->
    <section class="table-section">
        <div class="table-header">
            <h2>My Notes</h2>
            <div class="search-bar">
                <input type="text" placeholder="Search notes...">
                <button><i class="fas fa-search"></i></button>
            </div>
        </div>

        <table class="styled-table notes-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Course</th>
                <th>Title</th>
                <th>File</th>
                <th>Date Uploaded</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>Java Full Stack</td>
                <td>OOP Concepts.pdf</td>
                <td><a href="#" class="btn-view"><i class="fas fa-download"></i> Download</a></td>
                <td>2025-10-17</td>
                <td>
                    <button class="btn-small btn-edit"><i class="fas fa-edit"></i></button>
                    <button class="btn-small btn-delete"><i class="fas fa-trash-alt"></i></button>
                </td>
            </tr>
            <tr>
                <td>2</td>
                <td>Web Development</td>
                <td>HTML Basics.pdf</td>
                <td><a href="#" class="btn-view"><i class="fas fa-download"></i> Download</a></td>
                <td>2025-10-15</td>
                <td>
                    <button class="btn-small btn-edit"><i class="fas fa-edit"></i></button>
                    <button class="btn-small btn-delete"><i class="fas fa-trash-alt"></i></button>
                </td>
            </tr>
            </tbody>
        </table>
    </section>


    <!-- ===== ADD / EDIT NOTE MODAL ===== -->
    <div class="modal" id="noteModal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2 id="modalTitle">Add Note</h2>
            <form id="noteForm">
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
                    <label>Title</label>
                    <input type="text" id="title" placeholder="Enter note title" required>
                </div>
                <div class="form-group">
                    <label>Upload File</label>
                    <input type="file" id="file" accept=".pdf,.doc,.docx" required>
                </div>
                <button type="submit" class="btn-primary w-full">Save Note</button>
            </form>
        </div>
    </div>

</main>

<script>
    // ===== MODAL LOGIC =====
    const modal = document.getElementById('noteModal');
    const addBtn = document.getElementById('addNoteBtn');
    const closeBtn = modal.querySelector('.close');

    addBtn.onclick = () => { modal.style.display = 'block'; }
    closeBtn.onclick = () => { modal.style.display = 'none'; }
    window.onclick = (e) => { if(e.target == modal) modal.style.display = 'none'; }

    // ===== FORM SUBMISSION =====
    document.getElementById('noteForm').onsubmit = function(e){
        e.preventDefault();
        alert("Note saved! (Connect this to TeacherNotesServlet for CRUD)");
        modal.style.display = 'none';
        // TODO: Add AJAX / form submit to servlet
    }
</script>

</body>
</html>
