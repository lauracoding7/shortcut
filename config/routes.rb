Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  get 'dashboard_upcoming', to: 'pages#dashboard_upcoming', as: 'dashboard_upcoming'
  get 'dashboard_previous', to: 'pages#dashboard_previous', as: 'dashboard_previous'
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
    get 'reviews/new_client_rev', to: 'reviews#new_client_review', as: 'new_client_review' # to be used if we get to create the barber dashboard for the button to rate clients
    resources :services, only: [] do
      resources :appointments, only: [:new, :create]
    end
  end
  resources :appointments, only: [:show] do
    resources :messages, only: [:create]
  end
  get 'appointments/:id/approve', to: 'appointments#approve', as: 'approve_appointment'
  get 'appointments/:id/reject', to: 'appointments#reject', as: 'reject_appointment'
  get 'appointments/:id/pay', to: 'appointments#pay', as: 'pay_appointment'
end
