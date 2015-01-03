class TokensController < ApplicationController

  def request_token
    @code = params[:code]
    path = ApplicationHelper::BASE_URI + "oauth/token"
    params = { 'code' => @code,
               'redirect_uri' => ApplicationHelper::REDIRECT_URI,
               'client_id' => ApplicationHelper::APPLICATION_ID,
               'client_secret' => ApplicationHelper::APPLICATION_SECRET,
               'grant_type' => 'authorization_code',
               'scope' => ApplicationHelper::APPLICATION_SECRET }

    response = HTTParty.post(path, :query => params)
    response_body = JSON.parse(response.body)

    if response_body['access_token']
      puts ".....Saving token"
      auth = SrmApp.global.authorization || Authorization.new(srm_app: SrmApp.global)
      auth.update_attributes!(response_body)
      redirect_to root_url
    else
      puts "No access token given"
    end
  end

  def refresh_token
    auth = SrmApp.global.authorization
    path = ApplicationHelper::BASE_URI + "oauth/token"
    params = { 'refresh_token' => auth.refresh_token,
               'redirect_uri' => ApplicationHelper::REDIRECT_URI,
               'client_id' => ApplicationHelper::APPLICATION_ID,
               'client_secret' => ApplicationHelper::APPLICATION_SECRET,
               'grant_type' => 'refresh_token' }

    response = HTTParty.post(path, :query => params)
    response_body = JSON.parse(response.body)

    if response_body['access_token']
      puts ".....Refreshing token"
      auth.update_attributes!(response_body)
      redirect_to root_url
    else
      puts "No access token given"
    end
  end

  def delete_token
    if auth = SrmApp.global.authorization
      auth.destroy
    end
    redirect_to root_url
  end

end
