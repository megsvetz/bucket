Rails.application.routes.draw do
  root 'pages#home'

  get 'users/index'
  resources :categories
  resources :goals

  devise_for :users, controllers: {registrations: "registrations"}
end
