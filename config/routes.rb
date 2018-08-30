Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :subjects, only: [:index, :show]
  resources :goals, only: [:create, :show, :new,:destroy] do
    resources :tasks, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
