Rails.application.routes.draw do
  resources :streamers
  resources :movies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "static#index"

   get '/user/:id', to: 'user#show'
  get '/search/', to: 'movies#search'
  get '/view_movie/', to: 'movies#view_movie'

  Rails.application.routes.draw do
  resources :streamers
    devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions"
    }
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
