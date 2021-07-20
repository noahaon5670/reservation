Rails.application.routes.draw do
  root 'pages#index'
  
  get 'users/account'
  get 'users/profile'
  patch 'users/profile', to: 'users#update_profile'

  devise_for :users
  
  get 'rooms/posts'
  get 'rooms/search'
  resources :rooms, :only => [:show, :new, :edit, :update, :create, :destroy]
  
  post 'reservations/new', to: 'reservations#confilm'
  resources :reservations, :only => [:index, :show, :create, :destroy]
  
end
