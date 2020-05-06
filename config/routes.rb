Rails.application.routes.draw do
  devise_for :users
  root to: "records#index"
  resources :records, only: [:index, :new, :create, :show]
  resources :users, only: [:edit, :update, :show]
end