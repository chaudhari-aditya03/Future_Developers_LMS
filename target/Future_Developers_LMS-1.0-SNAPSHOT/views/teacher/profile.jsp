
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Profile | Future Developers LMS</title>
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
        <h1>My Profile</h1>
    </header>

    <!-- ===== PROFILE FORM ===== -->
    <section class="profile-section">
        <div class="profile-container">
            <!-- Profile Picture -->
            <div class="profile-pic">
                <img src="../images/teacher.png" alt="Teacher Avatar" id="profileImage">
                <input type="file" id="uploadPic" style="display:none;">
                <button class="btn-outline" onclick="document.getElementById('uploadPic').click()">Change Picture</button>
            </div>

            <!-- Personal Info Form -->
            <form class="profile-form">
                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" value="Jane Doe" required>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" value="jane.doe@example.com" required>
                </div>
                <div class="form-group">
                    <label>Phone</label>
                    <input type="text" value="+91 9876543210">
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" value="********" required>
                </div>
                <div class="form-group">
                    <label>Confirm Password</label>
                    <input type="password" value="********" required>
                </div>
                <button type="submit" class="btn-primary w-full">Update Profile</button>
            </form>
        </div>
    </section>
</main>

<script>
    // Preview selected profile picture
    const uploadPic = document.getElementById('uploadPic');
    const profileImage = document.getElementById('profileImage');
    uploadPic.addEventListener('change', function(e){
        const reader = new FileReader();
        reader.onload = function(){
            if(reader.readyState === 2){
                profileImage.src = reader.result;
            }
        }
        reader.readAsDataURL(e.target.files[0]);
    });
</script>
</body>
</html>
