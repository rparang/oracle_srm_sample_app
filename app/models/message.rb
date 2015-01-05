class Message

  def self.fetch_all(options={})
    auth = SrmApp.global.authorization
    bundle_id = options[:bundle_id].present? ? options[:bundle_id] : SrmBundle.global.bundle_id

    if auth
      response = SrmClient.fetch_engage_messages(auth, bundle_id)
      response['items']
    end
  end 

end 