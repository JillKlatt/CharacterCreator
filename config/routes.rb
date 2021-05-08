Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :characters do
    resources :weapons, only: [:index, :new, :create] # shallow: true (Create three nested routes, and four non-nested routes)
    resource :character_weapons, only: [:create]
  end

  resources :weapons
  resources :campaigns do
    resources :characters
    resource :adventures
  end
  resources :adventures
  resources :sessions, only: [:new, :create, :destroy]

  # Categories and Races have all been made, no need to have the routes available to delete or edit them
  # resources :categories
  # resources :races 
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: "sessions#logout"

  # get '/search', to: 'characters#search', as: 'search'
  # get '/characters/search', to: 'characters#search', as: 'characters#search

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  root('static#home')

  get '/last_updated', to: 'characters#last_updated', as: 'last_updated'

  delete '/characters/:id', to: 'characters#destroy', as: 'destroy'

end
