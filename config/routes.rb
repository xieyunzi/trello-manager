Rails.application.routes.draw do
  root 'home#index'
  get '/auth', to: 'auth#index'

  resources :notifications, only: [:index] do
    collection do
      post :refresh
    end

    member do
      post :read
      post :reply
    end
  end
end
