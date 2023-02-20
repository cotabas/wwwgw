Rails.application.routes.draw do
  resources :saves
  resources :streamers
  resources :movies
  
  root "static#index"

  get '/user/:id', to: 'user#show'
  get '/search/', to: 'movies#search'
  get '/view_movie/', to: 'movies#view_movie'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions"
  }
end
