Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :characters
  resources :categories
  resources :races 
  resources :weapons
  resources :campaigns do
    resources :characters, only: [:index, :new, :create]
    resource :adventures, only: [:create]
  end
  resources :adventures
  resources :sessions, only: [:new, :create, :destroy]
  
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: "sessions#logout"

  root('static#home')
end
