Rails.application.routes.draw do

  resources :posts do
    resources :comments
  end
   
  resources :upvotes, only: [:create, :destroy]
  resources :users

  root 'posts#index'
  resource :session, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
