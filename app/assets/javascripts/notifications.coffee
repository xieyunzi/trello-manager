$(document).ready ->
  $('#refresh_notifications').click ->
    $(this).attr('disabled', true).html('<span class="fa fa-refresh fa-spin"></span>')

  $('.notification a[id^="unread"]').click ->
    $(this).attr('disabled', true)
