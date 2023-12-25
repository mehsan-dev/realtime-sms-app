Rails.application.routes.draw do
  devise_for :users
  root 'notifications#index'

  resources :notifications, only: [:index]
end