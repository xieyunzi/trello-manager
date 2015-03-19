class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def trello_client
    Trello::Client.new(
      developer_public_key: Settings.trello.developer_public_key,
      member_token: session[:member_token]
    )
  end

  def current_user_id
    if session[:current_user_id].nil?
      begin
        session[:current_user_id] = trello_client.find(:members, :me).id
      rescue Trello::Error => e
        session.clear
        redirect_to root_path, alert: "#{e.to_s}, please clear your cookies."
      end
    end
    session[:current_user_id]
  end

  def need_connect_with_trello
    logger.debug "[DEBUG] session member_token: #{session[:member_token]}"

    redirect_to(
      root_path,
      status: 302,
      alert: 'You need connect with Trello.'
    ) if session[:member_token].nil?
  end
end
