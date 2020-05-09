Rails.application.routes.draw do
  devise_for :users
  root to: "teams#index"

  get '/teams/:id/list', to: 'teams#list'
  resources :users, only: :show
  resources :players
  resources :teams do
    resources :comments, only: :create
  end
end
