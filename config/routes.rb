Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"

  get '/teams/:id/chat', to: 'teams#chat'
  post "likes/:blog_id/create" => "likes#create"
  post "likes/:blog_id/destroy" => "likes#destroy"
  resources :users
  resources :manegers
  resources :players
  resources :blogs do
    resources :blogcomments, only: :create
    namespace :api do
      resources :blogcomments, only: :index, defaults: { format: 'json' }
    end
  end
  resources :teams do
    resources :comments, only: :create
    namespace :api do
      resources :comments, only: :index, defaults: { format: 'json' }
    end
  end
end
