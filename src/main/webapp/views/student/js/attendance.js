// For now, static overall percentage is set via CSS conic-gradient
// In future, can dynamically update via JS if fetching data from backend

// Example dynamic update (optional)
document.querySelectorAll('.progress-circle').forEach(circle => {
  const percentage = circle.getAttribute('data-percentage');
  circle.style.background = `conic-gradient(#1e90a1 0% ${percentage}%, #e0f7f5 ${percentage}% 100%)`;
  circle.querySelector('span').textContent = `${percentage}%`;
});
