// Tab functionality
const tabButtons = document.querySelectorAll('.tab-btn');
const tabContents = document.querySelectorAll('.tab-content');

tabButtons.forEach(btn => {
  btn.addEventListener('click', () => {
    // remove active class from buttons
    tabButtons.forEach(b => b.classList.remove('active'));
    btn.classList.add('active');

    // remove active class from tab contents
    tabContents.forEach(tc => tc.classList.remove('active'));
    document.getElementById(btn.dataset.tab).classList.add('active');
  });
});
