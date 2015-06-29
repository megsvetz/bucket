Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :categories
  resources :goals 
  root 'pages#home'
end
