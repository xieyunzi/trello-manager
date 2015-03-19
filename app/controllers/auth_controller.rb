class AuthController < ApplicationController
  def index
    logger.debug "[DEBUG] auth#index token: #{params[:token]}"

    session[:member_token] = params[:token]
    redirect_to notifications_path, notice: 'login success.'
  end
end
