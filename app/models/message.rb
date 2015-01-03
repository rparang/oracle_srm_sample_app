class Message

  def self.fetch_all(options={})
    auth = SrmApp.global.authorization
    bundle_id = options[:bundle_id].present? ? options[:bundle_id] : SrmBundle.global.bundle_id

    if auth
      response = HTTParty.get("#{ApplicationHelper::BASE_URI}/engage/v1/messages?bundle_id=#{bundle_id}", :headers => { "Authorization" => "Bearer #{auth.access_token}"})
      return response['items']
    else
      return nil
    end
  end 

end 