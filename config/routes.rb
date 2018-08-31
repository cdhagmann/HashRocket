Rails.application.routes.draw do

  resources :posts do
    resources :upvotes, only: [:create, :destroy]
    resources :comments
  end 

  resources :users

  root 'posts#index'
  resource :session, only: [:new, :create, :destroy]

  resources :sessions, :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
