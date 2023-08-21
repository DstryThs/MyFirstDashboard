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

// Get references to the elements
const userInput = document.getElementById('userInput');
const deleteButton = document.getElementById('deleteButton');

// Add event listener to the delete button
deleteButton.addEventListener('click', () => {
    userInput.value = ''; // Clear the user input
});

// Optionally, you can also save the user input to local storage to remember it across sessions
// Uncomment the following lines to enable local storage saving
/*
const savedInput = localStorage.getItem('savedInput');
if (savedInput) {
    userInput.value = savedInput;
}

userInput.addEventListener('input', () => {
    localStorage.setItem('savedInput', userInput.value);
});
*/

// script.js
document.addEventListener("DOMContentLoaded", function() {
  const datetimeElement = document.getElementById("datetime");
  const now = new Date();
  datetimeElement.textContent = now.toLocaleString();
});


