Rails.application.routes.draw do
  root 'posts#index'
  resources :usersaffairs, only: [:index, :show, :edit, :update]
  devise_for :users
  resources :posts, only: [:index,:create]
end
