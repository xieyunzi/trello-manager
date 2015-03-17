class NotificationsController < ApplicationController
  def index
    @notifications = Notification.order(:unread, :created_at).all
  end
end
