Rails.application.routes.draw do
  resources :movies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "static#index"

  get '/user/:id', to: 'user#show'
  get '/search/', to: 'movies#search'

  Rails.application.routes.draw do
    devise_for :users, controllers: {
    registrations: 'users/registrations'
    }
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
