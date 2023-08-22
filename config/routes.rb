Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :formations do
    resources :reservations, only: [:create]
  end
  resources :reservations, only: :destroy do
    patch "accept", to: "pages#accept"
    patch "reject", to: "pages#reject"
  end
  get "profile", to: "pages#profile"
  # Defines the root path route ("/")
  # root "articles#index"
end
