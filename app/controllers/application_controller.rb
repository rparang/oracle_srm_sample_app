class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_token

  def current_token
    token = Token.new
    @current_token = token.token
  end

end
