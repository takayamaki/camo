Rails.application.routes.draw do
  resources :arrivals
  resources :customers, only: [:index, :show]
  resources :products
end
