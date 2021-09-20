$(document).on 'turbolinks:load', ->
  $(document).on 'click', '.boards__table tbody tr', ->
    window.location.href = $(@).attr 'board_path';
