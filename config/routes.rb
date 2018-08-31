Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  root to: 'pages#home'

  get '/dashboard', to: 'pages#dashboard'

  # get 'goals/:goal_id/task/edit'
  resources :subjects, only: [:index, :show]
  resources :goals, only: [:index, :show, :new, :create, :destroy,] do
    resources :tasks, only: [:create,:new,:show,:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
