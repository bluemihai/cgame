$(document).ready(function(){
  $('#users-table').DataTable({
    searching: false,
    paging: false,
    order: [1, 'asc']
  });

  $('#user-activities-table').DataTable({
    searching: false,
    paging: false,
    order: [2, 'asc'],
    'columnDefs' : [
      { orderData: 1, targets: 0}
    ]
  });
});