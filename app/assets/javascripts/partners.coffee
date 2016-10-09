# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#partners-table').dataTable
    processing: true,
    serverSide: true,
    ajax: $('#partners-table').data('source'),
    pagingType: 'full_numbers',
    columns: [
        { data: '0' },
        { data: '1' }
        ]

  $('#partners-table tbody').on 'click', 'tr', -> window.location.href = "/#{this.parent.data('resource')}/#{this.id}"
