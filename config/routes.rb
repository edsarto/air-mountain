Rails.application.routes.draw do

  root to: "home#index"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }


  resources :trips, only: [:index, :show]

end
