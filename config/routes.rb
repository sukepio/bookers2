Rails.application.routes.draw do
  get 'home/about' => 'homes#about'
  root to: 'homes#top'
  devise_for :users
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  
  resources :users do
    member do 
      get :following, :follower
    end
  end
  
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  
  get'search' => 'searches#search'
  
end
