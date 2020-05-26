Rails.application.routes.draw do
  devise_for :users
  root "users#show"
  resource :users, only: :edit
  resources :credit_cards, only: :new
  get "/logout", to: "users#index"
end
