Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "pages#welcome"
  resources :books do 
    resources :reviews
  end

  resources :reviews, only: [:create, :update]

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  
  get 'auth/facebook/callback', to: "sessions#fb_create"

  resources :users

end
