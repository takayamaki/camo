Rails.application.routes.draw do
  resources :arrivals, only: [:index, :show, :create]
  resources :products
end
