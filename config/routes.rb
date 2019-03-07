Rails.application.routes.draw do
  get 'messages/index'
  get 'messages/show'
  get 'messages/new'
  get 'messages/create'
  get 'messages/index'
  get 'messages/new'
  get 'messages/create'
  get 'messages/search'
  get 'messages/new'
  get 'messages/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :reviews, only: [:index, :new, :create]
    resources :services, only: [:index, :new, :create, :destroy] do
      resources :appointments, only: [:new, :create]
    end
  end
  resources :appointments, only: [:index, :show] do
    resources :messages, only: [:index, :new, :create]
  end
end
