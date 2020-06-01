Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    post '/users/sign_up', to: 'users/registrations#create'
  end
  
  root 'top#index'
  resources :users, only: :show
  get '/logout', to: 'users#index'
  resources :items, only: [:new, :edit, :create, :show]
  resources :credit_cards, only: :new
  resources :buyings, only: [:new, :create]
  resources :categories, only: [:index, :show]
  resources :subcategories, only: [:show]
  resources :bottomcategories, only: [:show]
  
end