Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :competitions do
    resources :participations, only: [:create]
  end
  resources :participations, only: [:edit, :show]

  resources :participations, only: :update do
    resources :payments, only: :new
    resources :votes, only: :create
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
