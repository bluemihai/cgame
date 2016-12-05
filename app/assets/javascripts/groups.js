$(document).ready(function(){
  var availableIds = $('#select-all').data('available-ids')
  console.log('availableIds', availableIds, typeof availableIds);
  $('#select-all').on('click', function(){
    event.preventDefault();
    console.log('Selecting...');
    var allInputs = $('.checkbox input');
    var availableInputs = allInputs.filter(function(idx) {
      var input = allInputs[idx]
      var id = parseInt(input.value)
      console.log('id', id, 'availableIds.indexOf(id)', availableIds.indexOf(id));
      return availableIds.indexOf(parseInt(input.value)) !== -1
    }).prop('checked', true)
    console.log('availableInputs', availableInputs);
  })
})
