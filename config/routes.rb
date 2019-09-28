Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:index, :show]
  resources :posts, only: [:index,:create]
end
