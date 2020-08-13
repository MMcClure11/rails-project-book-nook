Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "pages#welcome"

  get 'auth/github/callback', to: "sessions#git_create"
  get '/signup' => 'users#new', as: :signup
  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/books/highest_ranked' => 'books#highest_ranked', as: :highest_ranked

  resources :books do 
    resources :reviews, except: [:show, :create, :update]
  end

  resources :users do
    resources :reviews, only: [:index ]
  end

  resources :reviews, only: [:create, :update]
  resources :lists
  resources :users, except: [:new, :show, :index]

  get '/dashboard' => 'users#dashboard', as: :dashboard 

  get '/users/most_reviews' => 'users#most_reviews', as: :most_reviews
  

  # match '*path', :to => 'application#routing_error', via: [:get, :post]

end
