Rails.application.routes.draw do
  resources :arrivals
  resources :customers, only: [:index]
  resources :products
end
