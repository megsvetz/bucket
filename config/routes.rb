Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :goals 

  root 'pages#home'
  get 'users/index'
end
