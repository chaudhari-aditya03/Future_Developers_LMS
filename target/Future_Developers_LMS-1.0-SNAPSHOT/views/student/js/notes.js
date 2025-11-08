// Simple search/filter functionality
const searchInput = document.getElementById('noteSearch');
const notesTable = document.getElementById('notesList');

searchInput.addEventListener('keyup', () => {
  const filter = searchInput.value.toLowerCase();
  const rows = notesTable.getElementsByTagName('tr');
  Array.from(rows).forEach(row => {
    const course = row.cells[0].textContent.toLowerCase();
    const topic = row.cells[1].textContent.toLowerCase();
    if(course.includes(filter) || topic.includes(filter)) {
      row.style.display = '';
    } else {
      row.style.display = 'none';
    }
  });
});
