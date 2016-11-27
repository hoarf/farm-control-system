dt = (t, c, l, o) ->
  $(t).dataTable
    order: o || [[ 0, 'asc' ]]
    iDisplayLength: 25,
    processing: true,
    serverSide: true,
    language: { "url": "https://cdn.datatables.net/plug-ins/1.10.12/i18n/Portuguese-Brasil.json" },
    ajax: $(t).data('source'),
    pagingType: 'full_numbers',
    columns: { data: i } for i in [0..c]

  $("#{t} tbody").on 'click', 'tr', -> window.location.href = "#{l}/#{this.id}"

$ ->
  dt '#partners-table', 1, "#{$('table').data('source')}"
  dt '#facts-table', 3, "#{$('table').data('source')}", [[ 0, 'desc' ]]
  dt '#accounts-table', 2, "#{$('table').data('source')}"
  dt '#inventories-table', 1, "#{$('table').data('source')}"
  dt '#credits-table', 1, "/livrodiario"
  dt '#debits-table', 1, "/livrodiario"
  dt '#moves-table', 1, "/livrodiario"
  dt '#entries-table', 4, "/livrodiario"
