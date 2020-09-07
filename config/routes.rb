Rails.application.routes.draw do
  devise_for :users
  
  resources :products
  root to: "products#index"
  get 'products', to: 'products#checked'
end
