class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_token

  def current_token
    auth = SrmApp.global.authorization
    @current_token = auth.access_token if auth
  end

end
