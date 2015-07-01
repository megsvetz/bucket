Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users, controllers: {registrations: "registrations"}

  resources :users, only: [:index, :show, :edit, :update]

  # get 'users/index' => 'users#index', as: :users

  resources :categories do
    resources :goals
  end

  post "/completed_goal" => "goals#completed"
end
