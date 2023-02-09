Rails.application.routes.draw do
  devise_for :users
  resources :shouts, only: %i[index create show]
  resources :users, only: %i[show]
  post 'user_avatar/create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'shouts#index'
end
