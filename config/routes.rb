Rails.application.routes.draw do
  resources :courses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  #/auth/google_oauth2/redirect/https%3A%2F%2Flaolmfhjaobpboigjfbclcphckmjodlp.chromiumapp.org%2Fcallback
  #get 'auth/:provider/redirect/:redirect_uri', to: 'sessions#redirect'
  # print("erroraaaaaa\n")
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'login/authorize', to: 'sessions#authorize'

  get 'auth/failure', to: redirect('/')
  get 'home', to: 'home#show'
  get 'me', to: 'me#show', as: 'me' 

  resources :reviews

  root to: "home#show"
  
end
