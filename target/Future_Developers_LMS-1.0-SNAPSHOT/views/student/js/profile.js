// Profile image preview
const fileUpload = document.getElementById("fileUpload");
const profileImage = document.getElementById("profileImage");

if (fileUpload) {
  fileUpload.addEventListener("change", function () {
    const file = this.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = function () {
        profileImage.src = reader.result;
      };
      reader.readAsDataURL(file);
    }
  });
}

// Simple password validation
const form = document.querySelector(".profile-form");
if (form) {
  form.addEventListener("submit", (e) => {
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;

    if (password && password !== confirmPassword) {
      alert("Passwords do not match!");
      e.preventDefault();
    }
  });
}
