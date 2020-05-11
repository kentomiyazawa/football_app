Rails.application.routes.draw do
  devise_for :users
  root to: "teams#index"

  get '/teams/:id/chat', to: 'teams#chat'
  resources :users
  resources :manegers
  resources :players
  resources :blogs do
    resources :blogcomments, only: :create
  end
  resources :teams do
    resources :comments, only: :create
  end
end
