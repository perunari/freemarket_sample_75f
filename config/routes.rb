Rails.application.routes.draw do
  devise_for :users
  root "users#show"
  resource :items, only: [:edit, :create, :show]
  resource :credit_cards, only: :new
  resources :users, only: :edit
  get "/logout", to: "users#index"
end