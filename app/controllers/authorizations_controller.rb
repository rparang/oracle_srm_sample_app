class AuthorizationsController < ApplicationController
  def create
    response = SrmClient.request_global_token(params[:code])
    response_body = JSON.parse(response.body)

    if response_body['access_token']
      auth = SrmApp.global.authorization || Authorization.new(srm_app: SrmApp.global)
      auth.update_attributes!(response_body)
    else
      flash[:error] = "ERROR: No access token provided."
    end

    redirect_to root_url
  end

  def update
    response = SrmClient.refresh_global_token
    response_body = JSON.parse(response.body)

    if response_body['access_token']
      SrmApp.global.authorization.update_attributes!(response_body)
    else
      flash[:error] = "ERROR: No refresh token provided."
    end

    redirect_to root_url
  end

  def destroy
    if auth = SrmApp.global.authorization
      auth.destroy
    else
      flash[:error] = "ERROR: No access token found to delete."
    end

    redirect_to root_url
  end

end
