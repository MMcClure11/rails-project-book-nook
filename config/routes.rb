Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "pages#welcome"
  resources :books do 
    resources :reviews, only: [:index, :show]
  end

end
