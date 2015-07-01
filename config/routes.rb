Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users

  resources :users, only: [:index, :show, :edit, :update]

  # get 'users/index' => 'users#index', as: :users

	get '/auth/:twitter/callback', to: 'sessions#create'

  resources :categories do
  resources :goals
  end

  post "/completed_goal" => "goals#completed"
end
