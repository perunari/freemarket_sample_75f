Rails.application.routes.draw do
  devise_for :users
  root 'users#show'
  resource :credit_cards, only: :new
end
