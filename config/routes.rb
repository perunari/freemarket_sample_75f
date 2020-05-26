Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resource :items, only: [:edit, :create, :show]
  resource :credit_cards, only: :new
end
