$(document).ready(function(){

  $('#select-all').on('click', function(){
    event.preventDefault();
    $('.checkbox input').prop('checked', true)
  })
})
