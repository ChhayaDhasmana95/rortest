Rails.application.routes.draw do 
  resources :users
  resources :friendships

  get '/friend', to: "friendships#friend"
  resources :sessions
 

   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
