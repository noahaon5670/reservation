Rails.application.routes.draw do
  root 'pages#index'
  
  get 'users/account'
  get 'users/profile'
  patch 'users/profile', to: 'users#update_profile'
  
  
  devise_for :users
  
  # devise_for :users, controllers: {
  #   registrations: 'users/registrations',
  #   sessions:      'users/sessions',
  # }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get 'rooms/posts'
  get 'rooms/search'
  resources :rooms
  
  post 'reservations/new', to: 'reservations#confilm'
  resources :reservations, :only => [:index, :show, :create]
  
end
