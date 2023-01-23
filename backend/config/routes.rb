Rails.application.routes.draw do
  resources :arrivals, only: [:index, :show]
  resources :products
end
