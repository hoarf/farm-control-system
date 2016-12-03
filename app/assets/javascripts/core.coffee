dt = (t, c, l, o, s) ->
  $(t).dataTable
    order: o || [[ 0, 'asc' ]]
    iDisplayLength: 50,
    processing: true,
    serverSide: true,
    bFilter: s || false,
    language: { "url": "https://cdn.datatables.net/plug-ins/1.10.12/i18n/Portuguese-Brasil.json" },
    ajax: $(t).data('source'),
    pagingType: 'full_numbers',
    columns: { data: i } for i in [0..c]

  $("#{t} tbody").on 'click', 'tr', -> window.location.href = "#{l}/#{this.id}"

$ ->
  dt '#partners-table', 1, "#{$('table').data('source')}", [[ 0, 'desc' ]], true
  dt '#facts-table', 3, "#{$('table').data('source')}", [[ 0, 'desc' ]], true
  dt '#accounts-table', 2, "#{$('table').data('source')}", [[ 0, 'desc' ]], true
  dt '#inventories-table', 1, "#{$('table').data('source')}", [[ 0, 'desc' ]], true
  dt '#credits-table', 1, "/livrodiario", [[ 0, 'desc' ]], false
  dt '#debits-table', 1, "/livrodiario", [[ 0, 'desc' ]], false
  dt '#moves-table', 2, "/livrodiario", [[ 0, 'desc' ]], false
  dt '#entries-table', 4, "/livrodiario", [[ 0, 'desc' ]], false
