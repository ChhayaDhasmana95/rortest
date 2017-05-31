Rails.application.routes.draw do 
  get 'password_reset/new'
  post 'password_reset/new', to: "password_reset#create"
  get 'password_reset/edit'

  resources :users
  resources :friendships

  get '/friend', to: "friendships#friend"
  resources :sessions
  resources :password_resets,only: [:new,:create,:edit,:update]
  
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
