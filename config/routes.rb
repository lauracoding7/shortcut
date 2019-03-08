Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :reviews, only: [:index, :new, :create]
    resources :services, only: [:index] do
      resources :appointments, only: [:new, :create]
    end
  end
  resources :appointments, only: [:index, :show] do
    resources :messages, only: [:index, :new, :create]
  end
end
