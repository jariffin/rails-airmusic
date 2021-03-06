Rails.application.routes.draw do
  devise_for :users
  root to: 'instruments#index'

  resources :instruments, only: [:index, :new, :show, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create, :edit, :update]
    resources :reviews, only: [:new, :create, :edit, :update]
  end
  resources :bookings, only: [:destroy]
  resources :reviews, only: [:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
