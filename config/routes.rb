# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts
  resources :comments

  resources :upvotes, only: %i[create destroy]
  resources :users

  root 'posts#index'
  resource :session, only: %i[new create destroy]

  resources :sessions, :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
