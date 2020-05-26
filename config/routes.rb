Rails.application.routes.draw do
  devise_for :users
  root "users#show"
  resource :items, only: [:index, :edit, :create, :show]
  resource :credit_cards, only: :new
  resource :users, only: :edit
  get "/logout", to: "users#index"

end
