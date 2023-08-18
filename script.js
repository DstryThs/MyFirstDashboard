const datetimeElement = document.getElementById('datetime');

function updateDateTime() {
  const currentDateTime = new Date();
  const formattedDateTime = currentDateTime.toLocaleString('en-US', {
    weekday: 'long',
    month: 'numeric',
    day: 'numeric',
    year: 'numeric',
    hour: 'numeric',
    minute: 'numeric',
    second: 'numeric',
    hour12: true
  });

  datetimeElement.textContent = `Current Date and Time: ${formattedDateTime}`;
  requestAnimationFrame(updateDateTime);
}

updateDateTime();

