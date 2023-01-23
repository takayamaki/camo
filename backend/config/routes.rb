Rails.application.routes.draw do
  resources :arrivals, only: [:index, :show, :create, :update]
  resources :products
end
