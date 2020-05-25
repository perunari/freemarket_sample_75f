Rails.application.routes.draw do
  devise_for :users
  root "users#show"
  # root "users#destroy"
  resources :credit_cards, only: :new
end
