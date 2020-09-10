Rails.application.routes.draw do
  devise_for :users
  
  resources :products
  root to: "products#index"
  resources :purchasers, only: [:index, :new, :create]
end
