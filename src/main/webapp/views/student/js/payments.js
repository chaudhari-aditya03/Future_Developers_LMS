// Action button events
document.querySelectorAll('.btn-primary').forEach(btn => {
  btn.addEventListener('click', () => {
    alert('Redirecting to payment gateway...');
  });
});

document.querySelectorAll('.btn-secondary').forEach(btn => {
  btn.addEventListener('click', () => {
    alert('Invoice downloaded!');
  });
});
