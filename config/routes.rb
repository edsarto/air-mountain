Rails.application.routes.draw do

  root to: "home#index"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }


  resources :trips, only: [:index, :show]

  resources :profiles, only: [:show]

  namespace :account do
    resources :trips, only: [:index, :new, :create, :edit, :update, :destroy] do
      resources :bookings, only: [:index, :new, :create]
    end
    resource :dashboard, only: :show, controller: "dashboard"
    resource :profile, only: [:edit, :update], controller: "profile"
  end

end
