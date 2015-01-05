Rails.application.routes.draw do

  root :to => "messages#index"

  match '/gatekeeper/callback' => 'authorizations#create', :via => [:get]
  match '/refresh_token' => 'authorizations#update', :via => [:get]
  match '/delete_token' => 'authorizations#destroy', :via => [:get]

end
