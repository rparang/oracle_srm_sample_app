Rails.application.routes.draw do

  root :to => "messages#index"

  match '/gatekeeper/callback' => 'tokens#request_token', :via => [:get]
  match '/refresh_token' => 'tokens#refresh_token', :via => [:get]
  match '/delete_token' => 'tokens#delete_token', :via => [:get]

end
