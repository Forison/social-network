Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  resources :posts, only: [:index,:create]
end
