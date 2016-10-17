dt = (t, c) ->
  $(t).dataTable
    processing: true,
    serverSide: true,
    ajax: $(t).data('source'),
    pagingType: 'full_numbers',
    columns: { data: i } for i in [0..c]

  $("#{t} tbody").on 'click', 'tr', -> window.location.href = "#{$('table').data('source')}/#{this.id}"

$ ->
  dt '#partners-table', 1
  dt '#facts-table', 4
  dt '#accounts-table', 2
  dt '#inventories-table', 2
