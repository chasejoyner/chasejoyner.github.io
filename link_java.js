const allLinks = document.querySelectorAll('.dynamic-link');

allLinks.forEach(link => {
  link.addEventListener('click', function() {
    // Remove id from all links
    links.forEach(link => {
            link.removeAttribute('id');
            link.style.color = '';
    });

    // Add decorations to link
    this.id = 'active-link';
  });
});