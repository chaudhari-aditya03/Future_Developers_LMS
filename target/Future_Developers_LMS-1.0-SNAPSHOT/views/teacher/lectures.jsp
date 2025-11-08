<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Lectures | Teacher Dashboard</title>
    <link rel="stylesheet" href="../css/style.css" />
    <link rel="stylesheet" href="../css/dashboard.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        /* Page-specific tweaks */
        .page-header {
            display:flex;
            justify-content:space-between;
            align-items:center;
            gap:1rem;
            margin-bottom:1rem;
        }
        .inline-form {
            background: #fff;
            padding: 1rem;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.06);
            margin-bottom: 1rem;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px;
            align-items: end;
        }
        .inline-form .form-group {
            display:flex;
            flex-direction:column;
        }
        .inline-form label { font-weight:500; margin-bottom:6px; color:#1f2937; }
        .inline-form input, .inline-form select, .inline-form textarea {
            padding:8px 10px;
            border-radius:8px;
            border:1px solid #cbd5e1;
            font-family: inherit;
            outline:none;
        }
        .inline-form textarea { resize:vertical; min-height:44px; }
        .inline-form .form-actions {
            grid-column: 1 / -1;
            display:flex;
            gap:8px;
            justify-content:flex-end;
        }
        .btn-cancel {
            background: #f3f4f6;
            color: #111827;
            border: 1px solid #e5e7eb;
            padding: 0.6rem 1rem;
            border-radius: 8px;
            cursor:pointer;
        }
        .small-muted { font-size:0.9rem; color:#6b7280; }

        /* table tweaks */
        .lectures-table {
            width:100%;
            border-collapse: collapse;
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 6px 20px rgba(0,0,0,0.06);
        }
        .lectures-table th {
            background: #1e90a1;
            color: white;
            padding: 12px 14px;
            text-align:left;
        }
        .lectures-table td {
            padding: 10px 12px;
            border-bottom: 1px solid #eef2f7;
            vertical-align: middle;
        }
        .action-btn {
            background:none;
            border:none;
            cursor:pointer;
            margin-right:6px;
            font-size:1rem;
        }
        .action-btn.edit { color:#1e90a1; }
        .action-btn.delete { color:#dc3545; }
        .action-btn.view { color:#0b6e78; }

        .top-controls {
            display:flex;
            gap:12px;
            align-items:center;
            margin-bottom:12px;
            flex-wrap:wrap;
        }
        .search-input {
            padding:8px 10px;
            border-radius:8px;
            border:1px solid #cbd5e1;
            width:260px;
        }
        .filter-select {
            padding:8px 10px;
            border-radius:8px;
            border:1px solid #cbd5e1;
        }

        @media (max-width:920px) {
            .inline-form { grid-template-columns: 1fr; }
            .profile-summary { display:none; } /* keep header compact on small */
            .search-input { width:100%; }
        }
    </style>
</head>
<body>

<!-- SIDEBAR -->
<aside class="sidebar">
    <div class="sidebar-header">
        <img src="../images/FD.jpeg" alt="Logo" class="sidebar-logo">
        <h2>Future Developers</h2>
    </div>

    <ul class="sidebar-menu">
        <li><a href="teacher-dashboard.html"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="courses.html"><i class="fas fa-book"></i> My Courses</a></li>
        <li class="active"><a href="lectures.html"><i class="fas fa-video"></i> Lectures</a></li>
        <li><a href="notes.html"><i class="fas fa-file-alt"></i> Notes</a></li>
        <li><a href="tests.html"><i class="fas fa-pen"></i> Tests</a></li>
        <li><a href="results.html"><i class="fas fa-chart-bar"></i> Results</a></li>
        <li><a href="attendance.html"><i class="fas fa-check-circle"></i> Attendance</a></li>
        <li><a href="reports.html"><i class="fas fa-chart-line"></i> Reports</a></li>
        <li><a href="profile.html"><i class="fas fa-user-cog"></i> Profile</a></li>
    </ul>

    <div class="sidebar-footer">
        <button class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</button>
    </div>
</aside>

<!-- MAIN -->
<main class="main-content">
    <header class="dashboard-header page-header">
        <div>
            <h1>Manage Lectures</h1>
            <p class="small-muted">Add, edit, delete and manage live/recorded lectures for your courses.</p>
        </div>

        <div class="profile-summary">
            <img src="../images/teacher.png" alt="teacher" class="profile-avatar">
            <div>
                <p><strong>Prof. Alex Carter</strong></p>
                <p class="small-muted">TCH2025 • Computer Science</p>
            </div>
        </div>
    </header>

    <!-- Inline Add/Edit Form -->
    <section>
        <form id="lectureForm" class="inline-form" autocomplete="off">
            <input type="hidden" id="lectureId" value="">
            <div class="form-group">
                <label for="courseSelect">Course</label>
                <select id="courseSelect" required>
                    <option value="">-- Select Course --</option>
                    <option value="Java Full Stack">Java Full Stack</option>
                    <option value="Spring Boot">Spring Boot</option>
                    <option value="Web Dev Essentials">Web Dev Essentials</option>
                </select>
            </div>

            <div class="form-group">
                <label for="titleInput">Lecture Title</label>
                <input id="titleInput" type="text" placeholder="e.g. Java OOP Concepts" required>
            </div>

            <div class="form-group">
                <label for="typeSelect">Type</label>
                <select id="typeSelect" required>
                    <option value="Recorded">Recorded</option>
                    <option value="Live">Live</option>
                </select>
            </div>

            <div class="form-group">
                <label for="dateInput">Date & Time</label>
                <input id="dateInput" type="datetime-local" required>
            </div>

            <div class="form-group">
                <label for="durationInput">Duration (mins)</label>
                <input id="durationInput" type="number" min="1" placeholder="e.g. 45" required>
            </div>

            <div class="form-group">
                <label for="linkInput">Video / Meeting Link (URL)</label>
                <input id="linkInput" type="url" placeholder="https://..." >
            </div>

            <div class="form-group">
                <label for="notesInput">Notes / Description</label>
                <textarea id="notesInput" placeholder="Optional notes or summary"></textarea>
            </div>

            <div class="form-actions">
                <button type="button" id="cancelBtn" class="btn-cancel" style="display:none;">Cancel</button>
                <button type="submit" id="saveBtn" class="btn-primary">Add Lecture</button>
            </div>
        </form>
    </section>

    <!-- Controls: Search & Filter -->
    <section class="top-controls">
        <input id="searchInput" class="search-input" placeholder="Search by title, course or type...">
        <select id="filterType" class="filter-select">
            <option value="">All Types</option>
            <option value="Live">Live</option>
            <option value="Recorded">Recorded</option>
        </select>
        <select id="filterCourse" class="filter-select">
            <option value="">All Courses</option>
            <option value="Java Full Stack">Java Full Stack</option>
            <option value="Spring Boot">Spring Boot</option>
            <option value="Web Dev Essentials">Web Dev Essentials</option>
        </select>
        <button id="clearFilters" class="btn-outline">Clear</button>
    </section>

    <!-- Lectures Table -->
    <section class="table-section">
        <table class="lectures-table" id="lecturesTable">
            <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Course</th>
                <th>Type</th>
                <th>Date & Time</th>
                <th>Duration</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <!-- rows injected by JS -->
            </tbody>
        </table>
    </section>

</main>

<script>
    (() => {
        // ---------- Helpers ----------
        const $ = sel => document.querySelector(sel);
        const $$ = sel => Array.from(document.querySelectorAll(sel));
        const LS_KEY = 'teacher_lectures_v1';

        // ---------- Elements ----------
        const lectureForm = $('#lectureForm');
        const lectureIdInput = $('#lectureId');
        const courseSelect = $('#courseSelect');
        const titleInput = $('#titleInput');
        const typeSelect = $('#typeSelect');
        const dateInput = $('#dateInput');
        const durationInput = $('#durationInput');
        const linkInput = $('#linkInput');
        const notesInput = $('#notesInput');
        const saveBtn = $('#saveBtn');
        const cancelBtn = $('#cancelBtn');

        const lecturesTableBody = $('#lecturesTable tbody');
        const searchInput = $('#searchInput');
        const filterType = $('#filterType');
        const filterCourse = $('#filterCourse');
        const clearFilters = $('#clearFilters');

        // ---------- Data ----------
        let lectures = [];

        // seed sample if none
        function seedData() {
            const existing = localStorage.getItem(LS_KEY);
            if (!existing) {
                const sample = [
                    {
                        id: generateId(),
                        title: 'Java OOP Concepts',
                        course: 'Java Full Stack',
                        type: 'Recorded',
                        datetime: new Date().toISOString().slice(0,16),
                        duration: 45,
                        link: '',
                        notes: 'Introduction to classes and objects'
                    },
                    {
                        id: generateId(),
                        title: 'Spring Boot REST API',
                        course: 'Spring Boot',
                        type: 'Live',
                        datetime: new Date(Date.now() + 3*24*3600*1000).toISOString().slice(0,16),
                        duration: 60,
                        link: 'https://meet.example.com/spring101',
                        notes: 'Live session with Q&A'
                    }
                ];
                localStorage.setItem(LS_KEY, JSON.stringify(sample));
            }
        }

        function loadData() {
            const raw = localStorage.getItem(LS_KEY);
            lectures = raw ? JSON.parse(raw) : [];
        }

        function saveData() {
            localStorage.setItem(LS_KEY, JSON.stringify(lectures));
        }

        // ---------- Utils ----------
        function generateId() {
            return 'LEC' + Math.floor(Math.random()*90000 + 10000);
        }

        function formatDateTime(dtStr) {
            if(!dtStr) return '';
            const d = new Date(dtStr);
            if (isNaN(d)) return dtStr;
            return d.toLocaleString();
        }

        // ---------- Render ----------
        function renderTable() {
            const q = searchInput.value.trim().toLowerCase();
            const fType = filterType.value;
            const fCourse = filterCourse.value;
            lecturesTableBody.innerHTML = '';

            const filtered = lectures.filter(l => {
                const matchQ = !q || (
                    l.title.toLowerCase().includes(q) ||
                    l.course.toLowerCase().includes(q) ||
                    l.type.toLowerCase().includes(q)
                );
                const matchType = !fType || l.type === fType;
                const matchCourse = !fCourse || l.course === fCourse;
                return matchQ && matchType && matchCourse;
            });

            if (filtered.length === 0) {
                const tr = document.createElement('tr');
                tr.innerHTML = `<td colspan="7" style="text-align:center;padding:18px;color:#6b7280;">No lectures found.</td>`;
                lecturesTableBody.appendChild(tr);
                return;
            }

            filtered.sort((a,b) => new Date(a.datetime) - new Date(b.datetime));

            filtered.forEach(l => {
                const tr = document.createElement('tr');
                tr.innerHTML = `
            <td>${l.id}</td>
            <td><strong>${escapeHtml(l.title)}</strong><div class="small-muted">${escapeHtml(l.notes || '')}</div></td>
            <td>${escapeHtml(l.course)}</td>
            <td>${escapeHtml(l.type)}</td>
            <td>${formatDateTime(l.datetime)}</td>
            <td>${l.duration} mins</td>
            <td>
              <button class="action-btn view" data-id="${l.id}" title="View"><i class="fas fa-eye"></i></button>
              <button class="action-btn edit" data-id="${l.id}" title="Edit"><i class="fas fa-edit"></i></button>
              <button class="action-btn delete" data-id="${l.id}" title="Delete"><i class="fas fa-trash-alt"></i></button>
            </td>
          `;
                lecturesTableBody.appendChild(tr);
            });

            // attach listeners
            $$('.action-btn.edit').forEach(btn => btn.addEventListener('click', onEdit));
            $$('.action-btn.delete').forEach(btn => btn.addEventListener('click', onDelete));
            $$('.action-btn.view').forEach(btn => btn.addEventListener('click', onView));
        }

        // ---------- Actions ----------
        function onView(e) {
            const id = e.currentTarget.dataset.id;
            const item = lectures.find(x => x.id === id);
            if (!item) return alert('Lecture not found');
            const details = `
Title: ${item.title}
Course: ${item.course}
Type: ${item.type}
Date/Time: ${formatDateTime(item.datetime)}
Duration: ${item.duration} mins
Link: ${item.link || '—'}
Notes: ${item.notes || '—'}
        `;
            alert(details);
        }

        function onEdit(e) {
            const id = e.currentTarget.dataset.id;
            const item = lectures.find(x => x.id === id);
            if (!item) return alert('Lecture not found');
            lectureIdInput.value = item.id;
            courseSelect.value = item.course;
            titleInput.value = item.title;
            typeSelect.value = item.type;
            dateInput.value = item.datetime;
            durationInput.value = item.duration;
            linkInput.value = item.link || '';
            notesInput.value = item.notes || '';
            saveBtn.textContent = 'Update Lecture';
            cancelBtn.style.display = 'inline-block';
            // scroll to form
            lectureForm.scrollIntoView({behavior:'smooth', block:'center'});
        }

        function onDelete(e) {
            const id = e.currentTarget.dataset.id;
            const item = lectures.find(x => x.id === id);
            if (!item) return;
            if (!confirm(`Delete lecture "${item.title}"? This cannot be undone.`)) return;
            lectures = lectures.filter(x => x.id !== id);
            saveData();
            renderTable();
        }

        // ---------- Form submit (Add / Update) ----------
        lectureForm.addEventListener('submit', (ev) => {
            ev.preventDefault();

            // validation
            if (!courseSelect.value) return alert('Please select a course.');
            if (!titleInput.value.trim()) return alert('Please enter lecture title.');
            if (!dateInput.value) return alert('Please select date and time.');
            if (!durationInput.value || Number(durationInput.value) <= 0) return alert('Please enter valid duration in minutes.');

            const idVal = lectureIdInput.value;
            if (idVal) {
                // update
                const idx = lectures.findIndex(x => x.id === idVal);
                if (idx === -1) return alert('Lecture not found.');
                lectures[idx] = {
                    ...lectures[idx],
                    title: titleInput.value.trim(),
                    course: courseSelect.value,
                    type: typeSelect.value,
                    datetime: dateInput.value,
                    duration: Number(durationInput.value),
                    link: linkInput.value.trim(),
                    notes: notesInput.value.trim()
                };
                saveData();
                resetForm();
                renderTable();
                alert('Lecture updated successfully.');
            } else {
                // add
                const newLecture = {
                    id: generateId(),
                    title: titleInput.value.trim(),
                    course: courseSelect.value,
                    type: typeSelect.value,
                    datetime: dateInput.value,
                    duration: Number(durationInput.value),
                    link: linkInput.value.trim(),
                    notes: notesInput.value.trim()
                };
                lectures.push(newLecture);
                saveData();
                resetForm();
                renderTable();
                alert('Lecture added successfully.');
            }
        });

        cancelBtn.addEventListener('click', (e) => {
            e.preventDefault();
            resetForm();
        });

        function resetForm() {
            lectureIdInput.value = '';
            courseSelect.value = '';
            titleInput.value = '';
            typeSelect.value = 'Recorded';
            dateInput.value = '';
            durationInput.value = '';
            linkInput.value = '';
            notesInput.value = '';
            saveBtn.textContent = 'Add Lecture';
            cancelBtn.style.display = 'none';
        }

        // ---------- Search & Filter ----------
        searchInput.addEventListener('input', renderTable);
        filterType.addEventListener('change', renderTable);
        filterCourse.addEventListener('change', renderTable);
        clearFilters.addEventListener('click', () => {
            searchInput.value = '';
            filterType.value = '';
            filterCourse.value = '';
            renderTable();
        });

        // ---------- Escape HTML (simple) ----------
        function escapeHtml(text) {
            if (!text) return '';
            return text
                .replaceAll('&', '&amp;')
                .replaceAll('<', '&lt;')
                .replaceAll('>', '&gt;')
                .replaceAll('"', '&quot;')
                .replaceAll("'", '&#039;');
        }

        // ---------- Init ----------
        seedData();
        loadData();
        renderTable();

        // keep sidebar links highlighting behavior
        $$('.sidebar-menu li a').forEach(a => {
            a.addEventListener('click', () => {
                $$('.sidebar-menu li').forEach(li => li.classList.remove('active'));
                a.parentElement.classList.add('active');
            });
        });

        // optional: logout button
        document.querySelector('.logout-btn').addEventListener('click', () => {
            alert('You have been logged out!');
            window.location.href = '../login.html';
        });

    })();
</script>
</body>
</html>
