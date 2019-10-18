Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users, controllers: { registrations: 'registrations',omniauth_callbacks: 'users/omniauth_callbacks',}
  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create, :show]
  resources :comments, only: [:create]
  resources :likes, only: [:create, :destroy]
  resources :search, only: [:show]
  resources :friendships, only: [:create, :destroy, :update]
  #  devise_scope :user do 
  #   get '/auth/facebook/callback', to: "users/omniauth_callbacks#facebook"
  # end
end
