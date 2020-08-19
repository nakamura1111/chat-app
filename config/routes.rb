Rails.application.routes.draw do
  devise_for :users
  
  root "rooms#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create]
  # resources :messages, only: :index
end
