$(document).ready(function() {
  // This uses masonry.js to prevent height
  // change in cards other than accordion
  // being opened
  $('#cards').masonry({
    itemSelector: '.card',
    columnWidth: '.grid-sizer',
    percentPosition: true
  });

  setTimeout(function(){
    $('#cards').masonry({
      itemSelector: '.card',
      columnWidth: '.grid-sizer',
      percentPosition: true
    });
  }, 100);

  setTimeout(function(){
    $('#cards').masonry({
      itemSelector: '.card',
      columnWidth: '.grid-sizer',
      percentPosition: true
    });
  }, 200);
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

  // Loop through each accordion-title and check if expanded
  // Set border-radius values accordingly
   // This prevents overflow on rounded tool cards.
  $('.accordion-title').each(function() {
    $(this).attr("aria-expanded") == "true" ?
    setTimeout(() => { $(this).css({ "border-bottom-left-radius": "0", "border-bottom-right-radius": "0" }); }, 45) :
    setTimeout(() => { $(this).css({ "border-bottom-left-radius": "8px", "border-bottom-right-radius": "8px" }); }, 200)
  });


})
