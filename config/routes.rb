Rails.application.routes.draw do
  devise_for :users
  root "users#show"
  resources :items, only: [:index, :edit, :create, :show]
  resources :credit_cards, only: :new
  resources :users, only: :edit
  get "/logout", to: "users#index"

end
