Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users, class_name: 'FormUser', :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
  resources :users, only: [:index, :show, :edit, :update]
  resources :categories do
    resources :goals
  end

	get '/auth/:twitter/callback', to: 'sessions#create'
  get '/goal/subregion_options', to: 'goals#subregion'

  post "/completed_goal" => "goals#completed"
end