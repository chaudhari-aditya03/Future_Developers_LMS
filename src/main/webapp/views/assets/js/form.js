// =============================
// ✅ FORM VALIDATION SCRIPT
// =============================

// Utility function to show alerts in a modern way
function showAlert(message) {
  alert(message); // (You can replace with a custom modal/snackbar later)
}

// =============================
// REGISTER FORM VALIDATION
// =============================
const registerForm = document.querySelector('form[action="registerServlet"]');

if (registerForm) {
  registerForm.addEventListener("submit", function (e) {
    const fullname = document.getElementById("fullname").value.trim();
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value.trim();
    const role = document.getElementById("role").value;

    // --- Validation rules ---
    if (!fullname || !email || !password || !role) {
      showAlert("⚠️ Please fill all the required fields.");
      e.preventDefault();
      return;
    }

    // Email validation
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email)) {
      showAlert("❌ Please enter a valid email address.");
      e.preventDefault();
      return;
    }

    // Password length
    if (password.length < 6) {
      showAlert("🔒 Password must be at least 6 characters long.");
      e.preventDefault();
      return;
    }

    // Success message (optional)
    console.log("✅ Registration form validated successfully!");
  });
}

// =============================
// LOGIN FORM VALIDATION
// =============================
const loginForm = document.querySelector('form[action="loginServlet"]');

if (loginForm) {
  loginForm.addEventListener("submit", function (e) {
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value.trim();
    const role = document.getElementById("role").value;

    if (!email || !password || !role) {
      showAlert("⚠️ Please enter email, password, and select your role.");
      e.preventDefault();
      return;
    }

    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email)) {
      showAlert("❌ Please enter a valid email address.");
      e.preventDefault();
      return;
    }

    if (password.length < 6) {
      showAlert("🔒 Password must be at least 6 characters long.");
      e.preventDefault();
      return;
    }

    console.log("✅ Login form validated successfully!");
  });
}
