Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth' }
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'

  resources :competitions do
    resources :participations, only: [:create]
  end
  resources :participations, only: [:edit, :show]
  get '/cancel_stripe/:id', to: 'participations#cancel_stripe', as: 'cancel_stripe'

  resources :participations, only: :update do
    resources :payments, only: :new
    resources :votes, only: :create
  end

  resources :votes, only: :update
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
