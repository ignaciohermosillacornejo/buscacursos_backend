Rails.application.routes.draw do
  
  ## Authentication routes ##

  ### JSON API
  
  #GET /loging/authorize?=redirect_uri
  #GET /auth/failure (when the user doesn't grant permissions to the app)
  # GET '/auth/:provider/redirect/:redirect_uri', to: 'sessions#create'
  get '/login/authorize', to: 'sessions#authorize'
  get '/auth/failure', to: 'sessions#failure'
  get '/auth/:provider/callback', to: 'sessions#create'
  
  ### HTML Login

  # TODO get this working again
  # GET '/login' -> Google oauth
  # GET '/logout', to: 'sessions#destroy'
  get '/login', to: redirect('/auth/google_oauth2'), as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  
  
  ## Courses routes ##

  #GET /courses/:id	courses#show
  #GET /courses/:id/section/:section_id
  resources :courses, format: "json"
  get 'courses/:id/section/:section_id', to: 'courses#section_classes', format: "json"

  ## Reviews routes ##

  #GET	/reviews	reviews#index
  #GET	/reviews/:id	reviews#show
  #POST	/reviews	reviews#create	
  #PATCH/PUT	/reviews/:id	reviews#update	
  #DELETE	/reviews/:id	reviews#destroy
  #POST /reviews/:id/like reviews#like
  #DELETE	/reviews/:id/like reviews#unlike
  #POST /reviews/:id/report reviews#report
  resources :reviews, format: "json"
  post '/reviews/:id/like', to: 'reviews#like', format: "json"
  delete '/reviews/:id/like', to: 'reviews#unlike', format: "json"
  post '/reviews/:id/report', to: 'reviews#report', format: "json"

  ## Bot routes ##

  #POST '/new-message', telegram#new_message
  post '/webhooks/telegram_asdfasdf' => 'telegram#callback', format: "json"

end
