Rails.application.routes.draw do
  devise_for :users
  root to: "teams#index"
  resources :users, only: :show
  resources :teams do
    resources :comments, only: :create
  end
end
