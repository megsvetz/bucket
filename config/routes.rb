Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users, controllers: {registrations: "registrations"}

  resources :users, only: [:show, :edit, :update]

  get 'users/index' => 'users#index', as: :users

  # get ':id' => "users#show"
  get 'users/:id' => 'users#show', as: :user_show

	get '/auth/:twitter/callback', to: 'sessions#create'

  resources :categories do
  resources :goals
  end

end
