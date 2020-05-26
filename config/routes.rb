Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resource :items, only: [:new, :edit]
  resources :credit_cards, only: :new
end
