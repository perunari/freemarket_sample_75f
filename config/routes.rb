Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :credit_cards, only: :new
end
