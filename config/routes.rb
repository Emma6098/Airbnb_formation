Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :formations do
    resources :reservations, only: [:new, :create, :accept, :reject]
  end
  resources :reservations, only: [:destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
