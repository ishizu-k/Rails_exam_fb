Rails.application.routes.draw do
  root to: 'records#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :records do
    collection do
      post :confirm
    end
    member do
      patch :confirm
    end
  end
end
