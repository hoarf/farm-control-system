dt = (t, c, l) ->
  $(t).dataTable
    processing: true,
    serverSide: true,
    ajax: $(t).data('source'),
    pagingType: 'full_numbers',
    columns: { data: i } for i in [0..c]

  $("#{t} tbody").on 'click', 'tr', -> window.location.href = "#{l}/#{this.id}"

$ ->
  dt '#partners-table', 1, "#{$('table').data('source')}"
  dt '#facts-table', 4, "#{$('table').data('source')}"
  dt '#accounts-table', 2, "#{$('table').data('source')}"
  dt '#inventories-table', 2, "#{$('table').data('source')}"
  dt '#credits-table', 2, "/livrodiario"
  dt '#debits-table', 2, "/livrodiario"
  dt '#moves-table', 2, "/livrodiario"
  dt '#entries-table', 4, "/livrodiario"
