class Message

  def self.all
    obj = Token.new
    token = obj.token

    if token
      response = HTTParty.get("#{ApplicationHelper::BASE_URI}/engage/v1/messages?bundle_id=#{ApplicationHelper::BUNDLE_ID}", :headers => { "Authorization" => "Bearer #{token['access_token']}"})
      return response['items']
    else
      return nil
    end
  end 

end 