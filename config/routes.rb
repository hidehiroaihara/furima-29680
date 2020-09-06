Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:new]
  resources :products, only: [:index, :edit, :new, :show]
  root to: "products#index"
end
