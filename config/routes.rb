Rails.application.routes.draw do
  resources :movies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "static#index"

   get '/users/:id', to: 'users#show'
  get '/search/', to: 'movies#search'
  get '/view_movie/', to: 'movies#view_movie'

  Rails.application.routes.draw do
    devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions"
    }
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
