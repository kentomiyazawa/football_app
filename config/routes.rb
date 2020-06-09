Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  post "likes/:blog_id/create" => "likes#create"
  post "likes/:blog_id/destroy" => "likes#destroy"

  get '/youtube', to: 'youtube#index'
  resources :users
  resources :manegers
  resources :players
  resources :games
  resources :matches
  resources :blogs do
    resources :blogcomments, only: :create
  end
  resources :teams do
    member do
      get 'chat'
    end
    resources :comments, only: :create
    namespace :api do
      resources :comments, only: :index, defaults: { format: 'json' }
    end
  end
end
