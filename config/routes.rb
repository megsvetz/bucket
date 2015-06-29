Rails.application.routes.draw do
  resources :users
  resources :categories
  resources :goals 
  root 'pages#home'
end
