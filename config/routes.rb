Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items,only: :new
  resources :credit_cards, only: :new
end
