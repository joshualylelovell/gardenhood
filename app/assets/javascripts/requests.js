$(document).ready(function() {

  // Set appropriate border radius to table head
  // if there are no items in the table.
  $("table").each(function() {
    $(this).find("tr").last().find('th').first().css("border-bottom-left-radius", "6px")
    $(this).find("tr").last().find('td').first().css("border-bottom-left-radius", "6px")
    $(this).find("tr").last().find('th').last().css("border-bottom-right-radius", "6px")
    $(this).find("tr").last().find('td').last().css("border-bottom-right-radius", "6px")
  })
})
