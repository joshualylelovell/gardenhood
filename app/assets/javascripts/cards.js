$(document).ready(function() {
  // This uses masonry.js to prevent height
  // change in cards other than accordion
  // being opened
  $('#cards').masonry({
    itemSelector: '.card',
    columnWidth: '.grid-sizer',
    percentPosition: true
  });
})

$(document).on('click', '.accordion-title', function() {
  // Call masonry.js to adjust layout 250ms after
  // accordion open or close
  setTimeout(function(){
    $('#cards').masonry({
      itemSelector: '.card',
      columnWidth: '.grid-sizer',
      percentPosition: true
    });
  }, 300);



})

// Need to implement click listene and if/else or switch case
// to change border-radius of .accordion-title and .accordion-content
