Rails.application.routes.draw do
  resources :lists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "pages#welcome"
  resources :books do 
    resources :reviews, except: [:show]
  end

  resources :reviews, only: [:create, :update]

  get '/signup' => 'users#new', as: :signup
  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  get 'auth/facebook/callback', to: "sessions#fb_create"

  resources :users, except: [:new, :show]

  get '/dashboard' => 'users#dashboard', as: :dashboard 

end
