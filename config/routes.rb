Rails.application.routes.draw do
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  resources :users, only: [ :index, :show ] do
    resources :reviews, only: [ :index, :new, :create ]
    resources :services, only: [ :index, :new, :create, :destroy ]
  end
  resources :appointments, only: [ :index, :show, :new, :create ] do
    resources :messages, only: [ :new, :create ]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
