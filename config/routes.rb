Rails.application.routes.draw do
  devise_for :users
  root to: "notifications#index"

  resources :notifications, only: %i[index new create]
end
