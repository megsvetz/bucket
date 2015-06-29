Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :goals 

  root 'pages#home'
  get 'users/index' => 'users#index', as: :users
  # get ':id' => "users#show"
  get 'users/:id' => 'users#show', as: :user_show

end

