// Filter lectures
const courseFilter = document.getElementById('course-filter');
const typeFilter = document.getElementById('type-filter');
const lectureCards = document.querySelectorAll('.lecture-card');

function filterLectures() {
  const course = courseFilter.value;
  const type = typeFilter.value;

  lectureCards.forEach(card => {
    const cardCourse = card.getAttribute('data-course');
    const cardType = card.getAttribute('data-type');
    const courseMatch = (course === 'all') || (cardCourse === course);
    const typeMatch = (type === 'all') || (cardType === type);

    if(courseMatch && typeMatch) {
      card.style.display = 'flex';
    } else {
      card.style.display = 'none';
    }
  });
}

courseFilter.addEventListener('change', filterLectures);
typeFilter.addEventListener('change', filterLectures);
