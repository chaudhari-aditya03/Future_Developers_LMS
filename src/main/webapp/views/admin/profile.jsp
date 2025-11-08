<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Profile | Future Developers LMS</title>
    <link rel="stylesheet" href="../css/admin.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a2c1234567.js" crossorigin="anonymous"></script>
</head>
<body>

<!-- ===== SIDEBAR ===== -->
<aside class="sidebar">
    <div class="sidebar-header">
        <img src="../images/FD.jpeg" alt="Logo" class="sidebar-logo">
        <h2>Admin </h2>
    </div>
    <ul class="sidebar-menu">
        <li><a href="dashboard.html"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="students.html"><i class="fas fa-user-graduate"></i> Students</a></li>
        <li><a href="teachers.html"><i class="fas fa-chalkboard-teacher"></i> Teachers</a></li>
        <li><a href="courses.html"><i class="fas fa-book"></i> Courses</a></li>
        <li><a href="lectures.html"><i class="fas fa-video"></i> Lectures</a></li>
        <li><a href="notes.html"><i class="fas fa-file-alt"></i> Notes</a></li>
        <li><a href="tests.html"><i class="fas fa-pen"></i> Tests & Results</a></li>
        <li><a href="attendance.html"><i class="fas fa-check-circle"></i> Attendance</a></li>
        <li><a href="payments.html"><i class="fas fa-wallet"></i> Payments</a></li>
        <li><a href="reports.html"><i class="fas fa-chart-line"></i> Reports</a></li>
        <li><a href="activity_logs.html"><i class="fas fa-clipboard-list"></i> Logs</a></li>
        <li class="active"><a href="profile.html"><i class="fas fa-user-cog"></i> Profile</a></li>
    </ul>

    <div class="sidebar-footer">
        <button class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</button>
    </div>
</aside>

<!-- ===== MAIN CONTENT ===== -->
<main class="main-content">
    <header class="dashboard-header">
        <h1>Admin Profile</h1>
    </header>

    <!-- ===== PROFILE FORM ===== -->
    <section class="profile-section">
        <form id="profileForm" enctype="multipart/form-data">
            <div class="profile-photo">
                <img src="../images/admin-avatar.png" alt="Admin Photo" id="profileImg">
                <input type="file" id="profileUpload" accept="image/*">
            </div>

            <div class="form-group">
                <label for="adminName">Name</label>
                <input type="text" id="adminName" value="John Doe" required>
            </div>

            <div class="form-group">
                <label for="adminEmail">Email</label>
                <input type="email" id="adminEmail" value="admin@example.com" readonly>
            </div>

            <div class="form-group">
                <label for="adminPhone">Phone</label>
                <input type="text" id="adminPhone" value="+91 9876543210">
            </div>

            <div class="form-group">
                <label for="adminPassword">Change Password</label>
                <input type="password" id="adminPassword" placeholder="New Password">
            </div>

            <div class="form-group">
                <label for="adminConfirmPassword">Confirm Password</label>
                <input type="password" id="adminConfirmPassword" placeholder="Confirm New Password">
            </div>

            <button type="submit" class="update-btn">Update Profile</button>
        </form>
    </section>
</main>

<script>
    // ===== LOGOUT =====
    document.querySelector('.logout-btn').addEventListener('click', () => {
        alert('You have been logged out!');
        window.location.href = '../login.html';
    });

    // ===== PROFILE PHOTO PREVIEW =====
    const profileUpload = document.getElementById('profileUpload');
    const profileImg = document.getElementById('profileImg');
    profileUpload.addEventListener('change', () => {
        const file = profileUpload.files[0];
        if(file) {
            const reader = new FileReader();
            reader.onload = e => profileImg.src = e.target.result;
            reader.readAsDataURL(file);
        }
    });

    // ===== FORM SUBMISSION =====
    const profileForm = document.getElementById('profileForm');
    profileForm.addEventListener('submit', (e) => {
        e.preventDefault();

        const password = document.getElementById('adminPassword').value;
        const confirmPassword = document.getElementById('adminConfirmPassword').value;
        if(password && password !== confirmPassword) {
            alert('Passwords do not match!');
            return;
        }

        // Mock update message
        alert('Profile updated successfully!');
    });
</script>

</body>
</html>
