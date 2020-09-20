Rails.application.routes.draw do
  get 'book_comments/create'
  get 'book_comments/destroy'
  root to: 'home#top'
  get 'home/about'
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update]
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resource :book_comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]

  resources :users do
    member do
     get :following, :followers
    end
  end

end