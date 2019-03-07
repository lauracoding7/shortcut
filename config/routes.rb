Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  get 'dashboard_upcoming', to: 'pages#dashboard_upcoming', as: 'dashboard_upcoming'
  get 'dashboard_previous', to: 'pages#dashboard_previous', as: 'dashboard_previous'
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :reviews, only: [:index, :new, :create]
    resources :services, only: [:index, :new, :create, :destroy]
  end
  resources :appointments, only: [:index, :show, :new, :create] do
    resources :messages, only: [:index, :new, :create]
  end
end
