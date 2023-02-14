Rails.application.routes.draw do
  resources :arrivals
  resources :customers, only: [:index, :show, :create]
  resources :products
end
