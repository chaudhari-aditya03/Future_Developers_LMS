// Enroll button click
document.querySelector('.enroll-btn').addEventListener('click', () => {
  alert('Redirecting to course enrollment page or modal!');
});

// Unenroll button click for each course
document.querySelectorAll('.unenroll-btn').forEach(btn => {
  btn.addEventListener('click', () => {
    const courseName = btn.closest('.course-card').querySelector('h3').innerText;
    if(confirm(`Are you sure you want to unenroll from "${courseName}"?`)){
      alert(`You have unenrolled from "${courseName}"`);
      // Here you can remove the card from DOM or trigger backend call
      btn.closest('.course-card').remove();
    }
  });
});
