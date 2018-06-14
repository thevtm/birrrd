Rails.application.routes.draw do
  get 'rentals/new'
  get 'rentals/create'
  root to: 'pages#home'

  devise_for :users

  resources :users, only: [:index, :show]

  resources :birds, only: [:index, :new, :create, :show, :edit, :update] do
    get "search", on: :collection
    resources :rentals, only: [:new, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
