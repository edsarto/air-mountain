Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"

  resources :trips, only: [:index, :show]

end
