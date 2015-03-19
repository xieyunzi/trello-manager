$('<%= "#unread-#{@notification.id}"%>')
  .attr('disabled', <%= !@notification.unread %>)
  .text('<%= t("notifications.unread.#{@notification.unread}") %>')
