// Sidebar item active toggle (UI only)
document.querySelectorAll('.sidebar-menu li').forEach(item => {
  item.addEventListener('click', () => {
    document.querySelectorAll('.sidebar-menu li').forEach(i => i.classList.remove('active'));
    item.classList.add('active');
  });
});

// Logout button
document.querySelector('.logout-btn').addEventListener('click', () => {
  alert('You have been logged out!');
  window.location.href = '../login.html';
});
