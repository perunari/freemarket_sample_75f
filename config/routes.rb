Rails.application.routes.draw do
  devise_for :users
  root 'users#show'
  resources :items, only: [:edit, :create, :show]
  resource :credit_cards, only: :new
end
