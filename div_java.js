// Get all links and div contents
const links = document.querySelectorAll('.top-div a');
const contents = document.querySelectorAll('.content');

// Loop through all contents until it matches clicked link
links.forEach((link) => {
  link.addEventListener('click', (event) => {
    event.preventDefault();
    const contentId = link.getAttribute('data-content');
    // Load desired content
    contents.forEach((content) => {
      if (content.id === contentId) {
        content.style.display = 'block';
      } else {
        content.style.display = 'none';
      }
    });
  });
});