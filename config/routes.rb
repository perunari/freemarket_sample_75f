Rails.application.routes.draw do
  devise_for :users

  root 'items#index'
  resources :users, only: :show
  get '/logout', to: 'users#index'
  resources :items, only: [:new, :edit, :create, :show]
  resources :credit_cards, only: :new
end