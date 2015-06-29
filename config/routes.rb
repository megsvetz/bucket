Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users, controllers: {registrations: "registrations"}

  get 'users/index' => 'users#index', as: :users

  # get ':id' => "users#show"
  get 'users/:id' => 'users#show', as: :user_show

  resources :categories do
    resources :goals
  end
  
end
