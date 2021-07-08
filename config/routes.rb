Rails.application.routes.draw do
  get 'users/account'
  get 'users/profile'
  patch 'users/profile', to: 'users#update_profile'
  root 'pages#index'
  # get 'pages/index'
  devise_for :users
  
  # devise_for :users, controllers: {
  #   registrations: 'users/registrations',
  #   sessions:      'users/sessions',
  # }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :rooms
end
