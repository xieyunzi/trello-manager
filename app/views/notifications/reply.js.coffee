$.notify(
  message: 'Content has been sent.'
,
  placement:
    from: 'bottom'
)

reply_btn = $('<%= "#reply-#{@reply_id}"%>')
reply_content = $('<%= "#reply-content-#{@reply_id}"%>').val()

# send reply
Trello.post(
  reply_btn.data('path')
  {
    text: "#{reply_btn.data('creator-member')} #{reply_content}"
    token: "<%= session[:member_token] %>"
  }
  ->
    # alert('success')
    $.notify(
      message: 'Reply successed.'
    ,
      type: 'success'
      placement:
        from: 'bottom'
    )
  ->
    #alert('error')
    $.notify(
      message: 'Reply faild.'
    ,
      type: 'danger'
      placement:
        from: 'bottom'
    )
)

# mark read
unread_btn = $('<%= "#unread-#{@reply_id}"%>')
unread_btn.click()
