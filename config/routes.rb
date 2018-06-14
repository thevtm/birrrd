Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :users, only: [:show]


  resources :birds, only: [:index, :new, :create, :show, :edit, :update] do
    get "search", on: :collection
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
