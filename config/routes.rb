Rails.application.routes.draw do
  # get 'flats/:id', to: "flats#show", as: "flat"
  # get 'flats', to: "flats#index", as: "flats"
  # <=>
  resources :flats, only: [:index, :show]

  devise_for :users
  root to: 'pages#home'
  resources :flats
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
