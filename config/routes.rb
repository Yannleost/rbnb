Rails.application.routes.draw do
  # get 'flats/:id', to: "flats#show", as: "flat"
  # get 'flats', to: "flats#index", as: "flats"
  # <=>

  devise_for :users
  root to: 'pages#home'
  resources :flats do
  resources :reservations, only: [:new, :create]
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
