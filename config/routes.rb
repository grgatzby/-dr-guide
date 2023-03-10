Rails.application.routes.draw do
  devise_for :users
  root to: "experiences#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :experiences do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
    resources :bookings, only: [:new, :create, :destroy]
  end
  get "bookings", to: "bookings#index"
end
