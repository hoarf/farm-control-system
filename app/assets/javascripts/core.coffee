ready = ->
  dataTableOptions = {
    "responsive": true,
    "language": {
      "url": "https://cdn.datatables.net/plug-ins/1.10.12/i18n/Portuguese-Brasil.json"
    },
    "destroy": true,
    "retrieve": true
  }

  $('[data-toggle="tooltip"]').tooltip()
  $('#dataTables-sales').DataTable dataTableOptions
  $('#dataTables-buys').DataTable dataTableOptions

$(document).on 'ready page:change', ready
