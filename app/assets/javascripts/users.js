$(document).ready(function(){
  $('#users-table').DataTable({
    searching: false,
    paging: false,
    order: [1, 'asc']
  });
});