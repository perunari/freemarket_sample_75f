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
  resources :users, only: :show do
    resources :credit_cards, only: [:new, :create, :show, :destroy]
  end

  get '/logout', to: 'users#index'

  resources :items, except: :index do
    collection do
      get 'get_child_categories', defaults: { format: 'json' }
      get 'get_grandchild_categories', defaults: { format: 'json' }
    end
    resources :buyings, only: [:new, :create]
  end

  resources :categories, only: [:index, :show]
  resources :subcategories, only: [:show]
  resources :bottomcategories, only: [:show]
  
  
end