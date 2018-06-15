Rails.application.routes.draw do
  get 'rentals/new'
  get 'rentals/create'
  root to: 'pages#home'

  devise_for :users

  get "/users/myprofile", to: "users#my_profile"

  resources :users, only: [:index, :show]

  resources :birds, only: [:index, :new, :create, :show, :edit, :update] do
    get "search", on: :collection
    resources :rentals, only: [:new, :create]
    resources :reviews, only: [:new, :create, :delete]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
