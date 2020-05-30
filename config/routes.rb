Rails.application.routes.draw do
  devise_for :users

  root 'top#index'
  resources :users, only: :show
  get '/logout', to: 'users#index'
  resources :items, only: [:new, :edit, :create, :show]
  resources :credit_cards, only: :new
  resources :buyings, only: [:new, :create]
  resources :categories, only: [:index, :show]
  # get '/subcategories/:id', to: 'categories#show'
end