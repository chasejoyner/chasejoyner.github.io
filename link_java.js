const allLinks = document.querySelectorAll('.dynamic-link');

allLinks.forEach(link => {
  link.addEventListener('click', function() {
    // Remove id from all links
    links.forEach(link => link.removeAttribute('id'));

    // Add 'underline' id to the clicked link
    this.id = 'underline';
  });
});