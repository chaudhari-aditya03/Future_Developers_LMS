<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>User Profile | Future Developers LMS</title>

    <!-- CSS -->


    <link rel="stylesheet" href="assets/css/dashboard.css" />
    <link rel="stylesheet" href="assets/css/profile.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a2c1234567.js" crossorigin="anonymous"></script>
</head>
<body>

<!-- ===== SIDEBAR ===== -->
<aside class="sidebar">
    <div class="sidebar-header">
        <img src="assets/images/logo.png" alt="Logo">
        <h3>Future LMS</h3>
    </div>
    <ul class="sidebar-menu">
        <li><i class="fas fa-home"></i> Dashboard</li>
        <li><i class="fas fa-book-open"></i> Courses</li>
        <li class="active"><i class="fas fa-user"></i> Profile</li>
        <li><i class="fas fa-sign-out-alt"></i> Logout</li>
    </ul>
</aside>

<!-- ===== MAIN CONTENT ===== -->
<main class="main-content">
    <header class="topbar">
        <h2>My Profile</h2>
        <div class="user-info">
            <i class="fas fa-user-circle"></i> Logged in as <span>Student</span>
        </div>
    </header>

    <!-- ===== PROFILE SECTION ===== -->
    <section class="profile-section">
        <div class="profile-card">
            <div class="profile-photo">
                <img src="assets/images/default-user.png" alt="Profile Photo" id="profileImage">
                <label for="fileUpload" class="upload-btn"><i class="fas fa-camera"></i></label>
                <input type="file" id="fileUpload" accept="image/*" hidden>
            </div>

            <form action="updateProfileServlet" method="post" class="profile-form">
                <div class="form-group">
                    <label for="name"><i class="fas fa-user"></i> Full Name</label>
                    <input type="text" id="name" name="name" value="John Doe" required>
                </div>

                <div class="form-group">
                    <label for="email"><i class="fas fa-envelope"></i> Email</label>
                    <input type="email" id="email" name="email" value="johndoe@example.com" required>
                </div>

                <div class="form-group">
                    <label for="phone"><i class="fas fa-phone-alt"></i> Phone</label>
                    <input type="text" id="phone" name="phone" value="+91 98765 43210">
                </div>

                <div class="form-group">
                    <label for="role"><i class="fas fa-user-tag"></i> Role</label>
                    <input type="text" id="role" name="role" value="Student" readonly>
                </div>

                <hr>

                <div class="form-group">
                    <label for="password"><i class="fas fa-lock"></i> New Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter new password">
                </div>

                <div class="form-group">
                    <label for="confirmPassword"><i class="fas fa-lock"></i> Confirm Password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm new password">
                </div>

                <button type="submit" class="btn primary">Update Profile</button>
            </form>
        </div>
    </section>
</main>

<!-- JS -->
<script src="assets/js/dashboard.js"></script>
<script src="assets/js/profile.js"></script>
</body>
</html>
