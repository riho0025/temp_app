Rails.application.routes.draw do
  devise_for :users
  root to: "records#index"
  resources :records, only: [:index, :new, :create]
    resources :users, only: [:edit, :update]
end