class SrmClient
  include HTTParty
  debug_output $stderr
  base_uri "https://gatekeeper.staging.cloud.vitrue.com/"

  REDIRECT_URI       = "http://localhost:3000/gatekeeper/callback"
  SCOPE              = "sem_engage"

  def self.global_authorization_url
    "#{base_uri}/oauth/authorize?client_id=#{SrmApp.global.app_id}&scope=#{SCOPE}&redirect_uri=#{REDIRECT_URI}&response_type=code"
  end

  def self.request_global_token(code)
    self.post("/oauth/token", 
      :query => self.global_params.merge(:code => code, :grant_type => 'authorization_code')
    )
  end

  def self.refresh_global_token
    self.post("/oauth/token", 
      :query => self.global_params.merge(:refresh_token => SrmApp.global.authorization.refresh_token, :grant_type => 'refresh_token')
    )
  end

  def self.fetch_engage_messages(auth, bundle_id)
    self.get("/engage/v1/messages?bundle_id=#{bundle_id}", :headers => { "Authorization" => "Bearer #{auth.access_token}"})
  end

  private

  def self.global_params
    { 
      'redirect_uri' => REDIRECT_URI,
      'client_id' => SrmApp.global.app_id,
      'client_secret' => SrmApp.global.app_secret,
      'grant_type' => 'authorization_code',
      'scope' => SCOPE 
    }
  end

end