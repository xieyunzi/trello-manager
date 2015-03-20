$(document).ready ->
  $('#refresh_notifications').click ->
    $(this).attr('disabled', true).html('<span class="fa fa-refresh fa-spin"></span>')

  $('.notification a[id^="unread"]').click ->
    $(this).attr('disabled', true)


 # auto refresh notifications pre 2 minutes
  refresh_notifications = ->
    $('#refresh_notifications').click()

  setTimeout(refresh_notifications, 5000 * 60)
