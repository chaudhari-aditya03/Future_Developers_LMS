// Simple Frontend Validation

function validateLogin() {
  const email = document.getElementById("email").value.trim();
  const password = document.getElementById("password").value.trim();

  if (email === "" || password === "") {
    alert("Please fill in all fields.");
    return false;
  }
  return true;
}

function validateRegister() {
  const name = document.getElementById("name").value.trim();
  const email = document.getElementById("email").value.trim();
  const pass = document.getElementById("password").value.trim();
  const confirm = document.getElementById("confirmPassword").value.trim();

  if (!name || !email || !pass || !confirm) {
    alert("All fields are required.");
    return false;
  }
  if (pass !== confirm) {
    alert("Passwords do not match!");
    return false;
  }
  return true;
}
