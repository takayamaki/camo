Rails.application.routes.draw do
  resources :arrivals, only: [:index]
  resources :products
end
