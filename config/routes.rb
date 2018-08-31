Rails.application.routes.draw do

  get 'sessions/new'
  get 'users/new'
  get 'users/show'
  get 'user/new'
  get 'user/show'

  root "users#new"

  resources :sessions, :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
