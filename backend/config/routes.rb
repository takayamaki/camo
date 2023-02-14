Rails.application.routes.draw do
  resources :arrivals
  resources :customers, only: [:index, :show, :create, :update]
  resources :products
end
