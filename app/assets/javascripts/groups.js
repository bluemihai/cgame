$(document).ready(function(){

  $('#select-all').on('click', function(){
    event.preventDefault();
    if ($(this).val() === 'Select All') {
      $('.checkbox input').prop('checked', true)
      $(this).val('Deselect All')
    } else {
      $('.checkbox input').prop('checked', false)
      $(this).val('Select All')
    }
  })
})


$(document).on('click', '#checkAll', function() {
 
   if ($(this).val() == 'Check All') {
     $('.button input').prop('checked', true);
     $(this).val('Uncheck All');
   } else {
     $('.button input').prop('checked', false);
     $(this).val('Check All');
   }
 });
