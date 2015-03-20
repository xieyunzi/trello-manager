class NotificationsController < ApplicationController
  before_action :need_connect_with_trello

  def index
    @notifications = Notification
      .includes(:creator_member, :board, :card)
      .where(mentioned_to: current_user_id, nf_type: Notification::MENTIONED_ON_CARD)
      .order(unread: :desc, created_at: :desc).all
  end

  def read
    notification_id = params[:id]
    unread_state = false

    resp = trello_client.put(
      "/notifications/#{notification_id}",
      unread: unread_state
    )
    logger.debug "[DEBUG] response: #{resp.inspect}"
    unread_state =  JSON.parse(resp)['unread']

    @notification = Notification.find(notification_id)
    @notification.update unread: unread_state
  end

  def reply
    @reply_id = params[:id]
  end

  def refresh
    Member.refresh_notification(trello_client)
    flash[:notice] = 'notification updated.'
    render js: "window.location = '#{notifications_path}'"
  end
end
