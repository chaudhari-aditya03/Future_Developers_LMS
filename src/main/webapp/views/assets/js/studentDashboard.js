document.addEventListener('DOMContentLoaded', function() {
    const navLinks = document.querySelectorAll('.nav-link');
    const contentSections = document.querySelectorAll('.content-section');
    const pageTitle = document.getElementById('page-title');

    // --- Single Page Application (SPA) Navigation Logic ---
    function navigateToSection(hash) {
        let targetHash = hash || '#dashboard'; // Default to dashboard

        // Find the link that matches the hash
        const targetLink = document.querySelector(`.nav-link[href="${targetHash}"]`);

        if (targetLink) {
            navLinks.forEach(link => link.classList.remove('active'));
            contentSections.forEach(section => section.classList.remove('active'));

            targetLink.classList.add('active');
            const targetSection = document.querySelector(targetHash);
            if(targetSection) {
                targetSection.classList.add('active');
                pageTitle.textContent = targetLink.querySelector('span').textContent;

                // Load data for the target section
                loadContentForSection(targetHash);
            }
        }
    }

    // Event listener for sidebar navigation links
    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const targetHash = this.getAttribute('href');
            // Update URL hash without reloading the page
            history.pushState(null, null, targetHash);
            navigateToSection(targetHash);
        });
    });

    // Event listener for quick links on the dashboard
    document.body.addEventListener('click', function(e) {
        if (e.target.matches('.quick-link')) {
            e.preventDefault();
            const targetHash = e.target.getAttribute('href');
            history.pushState(null, null, targetHash);
            navigateToSection(targetHash);
        }
    });

    // Handle browser back/forward buttons
    window.addEventListener('popstate', () => {
        navigateToSection(location.hash);
    });

    // --- Dynamic Content Loading ---
    function loadContentForSection(sectionId) {
        // In a real application, you would make an API call here.
        // For this demo, we'll call functions that generate mock content.
        switch (sectionId) {
            case '#dashboard':
                loadDashboardData();
                break;
            case '#profile':
                loadProfileData();
                break;
            case '#courses':
                loadCoursesData();
                break;
            case '#analytics':
                loadAnalyticsData();
                break;
            // Add cases for other sections here
            default:
                // Show a placeholder for sections not yet implemented
                const section = document.querySelector(sectionId);
                if (section) {
                    section.innerHTML = `<div class="content-card"><h2>Coming Soon</h2><p>This section is under construction.</p></div>`;
                }
        }
    }

    // --- MOCK DATA & CONTENT GENERATION FUNCTIONS ---

    function loadDashboardData() {
        // TODO: Backend Integration
        // fetch('/api/dashboard/stats') -> get JSON data
        document.getElementById('enrolled-courses-count').textContent = '8';
        document.getElementById('completed-lectures-count').textContent = '120';
        document.getElementById('attendance-percentage').textContent = '92%';
        document.getElementById('upcoming-tests-count').textContent = '3';
    }

    function loadProfileData() {
        // TODO: Backend Integration
        // fetch('/api/student/profile') -> get JSON data
        const profileData = {
            name: 'Alex Doe',
            email: 'alex.doe@example.com',
            phone: '123-456-7890',
            age: 21,
            gender: 'Male',
            address: '123 University Lane, College Town, USA',
            education: 'B.Sc. in Computer Science',
            avatar: 'https://placehold.co/150x150/6366F1/FFFFFF?text=AD',
            resume: 'alex_doe_resume.pdf'
        };

        const profileSection = document.getElementById('profile');
        profileSection.innerHTML = `
            <div class="content-card">
                <h2><i class="fa-solid fa-id-card"></i> Profile Management</h2>
                <div style="display: flex; align-items: flex-start; gap: 2rem;">
                    <div>
                        <img src="${profileData.avatar}" alt="Profile Photo" style="width: 150px; height: 150px; border-radius: 50%; object-fit: cover;">
                        <input type="file" id="photoUpload" style="display: none;">
                        <button class="btn btn-secondary" style="width: 150px; margin-top: 1rem;" onclick="document.getElementById('photoUpload').click();">Update Photo</button>
                    </div>
                    <form id="profileForm" style="flex-grow: 1;">
                        <div class="form-group">
                            <label>Full Name</label>
                            <input type="text" class="form-control" value="${profileData.name}" readonly>
                        </div>
                        <div class="form-group">
                            <label>Email Address</label>
                            <input type="email" class="form-control" value="${profileData.email}" readonly>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone Number</label>
                            <input type="tel" id="phone" class="form-control" value="${profileData.phone}">
                        </div>
                         <div class="form-group">
                            <label for="address">Address</label>
                            <textarea id="address" class="form-control" rows="3">${profileData.address}</textarea>
                        </div>
                        <div class="form-group">
                             <label>Current Resume: <a href="#">${profileData.resume}</a></label>
                             <input type="file" class="form-control">
                        </div>
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                    </form>
                </div>
            </div>
        `;
    }

    function loadCoursesData() {
        // TODO: Backend Integration
        // fetch('/api/student/courses') -> get JSON data
        const courses = [
            { id: 1, title: 'Introduction to Web Development', progress: 75, instructor: 'Dr. Smith' },
            { id: 2, title: 'Advanced CSS and Animations', progress: 30, instructor: 'Prof. Jones' },
            { id: 3, title: 'JavaScript for Beginners', progress: 95, instructor: 'Dr. Smith' },
            { id: 4, title: 'Backend with Java Servlets', progress: 15, instructor: 'Prof. Davis' }
        ];

        let coursesHTML = `<div class="content-card"><h2><i class="fa-solid fa-layer-group"></i> My Enrolled Courses</h2></div>`;
        courses.forEach(course => {
            coursesHTML += `
                <div class="content-card">
                    <div style="display: flex; justify-content: space-between; align-items: center;">
                        <div>
                            <h3 style="margin-bottom: 0.5rem;">${course.title}</h3>
                            <p style="color: var(--text-secondary); font-size: 0.9rem;">Instructor: ${course.instructor}</p>
                        </div>
                        <button class="btn btn-primary">View Details</button>
                    </div>
                    <p style="margin-top: 1rem;">Progress: ${course.progress}%</p>
                    <div style="background: var(--border-color); border-radius: 10px; height: 10px; margin-top: 0.5rem;">
                        <div style="width: ${course.progress}%; height: 100%; background: var(--primary-color); border-radius: 10px;"></div>
                    </div>
                </div>
            `;
        });
        document.getElementById('courses').innerHTML = coursesHTML;
    }

    function loadAnalyticsData() {
        const analyticsSection = document.getElementById('analytics');
        analyticsSection.innerHTML = `
            <div class="content-card">
                 <h2><i class="fa-solid fa-chart-pie"></i> Progress & Analytics</h2>
                 <div style="width: 100%; max-width: 600px; margin: auto;">
                    <canvas id="attendanceChart"></canvas>
                 </div>
            </div>
             <div class="content-card">
                 <div style="width: 100%; max-width: 600px; margin: auto;">
                    <canvas id="testScoresChart"></canvas>
                 </div>
            </div>
        `;

        // TODO: Backend Integration
        // fetch('/api/analytics/attendance') -> get data for chart
        new Chart(document.getElementById('attendanceChart'), {
            type: 'doughnut',
            data: {
                labels: ['Attended', 'Missed'],
                datasets: [{
                    label: 'Attendance',
                    data: [92, 8],
                    backgroundColor: [ 'rgba(16, 185, 129, 0.8)', 'rgba(239, 68, 68, 0.8)' ],
                    borderColor: [ 'rgba(16, 185, 129, 1)', 'rgba(239, 68, 68, 1)' ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { position: 'top' },
                    title: { display: true, text: 'Overall Attendance Percentage' }
                }
            }
        });

        // TODO: Backend Integration
        // fetch('/api/analytics/scores') -> get data for chart
        new Chart(document.getElementById('testScoresChart'), {
            type: 'line',
            data: {
                labels: ['Test 1', 'Test 2', 'Mid-Term', 'Test 3', 'Test 4', 'Finals'],
                datasets: [{
                    label: 'Test Scores (%)',
                    data: [85, 88, 75, 92, 89, 94],
                    fill: false,
                    borderColor: 'rgb(99, 102, 241)',
                    tension: 0.1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { position: 'top' },
                    title: { display: true, text: 'Test Performance Over Time' }
                },
                scales: { y: { beginAtZero: true, max: 100 } }
            }
        });
    }

    // --- Initial Load ---
    // Load content based on the initial URL hash, or default to dashboard
    navigateToSection(location.hash);
});
