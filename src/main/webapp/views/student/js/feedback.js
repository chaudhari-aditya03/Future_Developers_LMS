const feedbackForm = document.getElementById('feedbackForm');

feedbackForm.addEventListener('submit', function(e) {
  e.preventDefault();
  const subject = document.getElementById('subject').value.trim();
  const message = document.getElementById('message').value.trim();

  if(subject && message) {
    alert('Feedback submitted successfully!');
    feedbackForm.reset();
    // In real app, send data to server via AJAX/fetch
  } else {
    alert('Please fill out all fields.');
  }
});
