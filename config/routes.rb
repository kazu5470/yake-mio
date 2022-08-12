Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  root to: 'public/homes#top'
  resources :maps, only: [:index]
  get '/map_request', to: 'maps#map', as: 'map_request'
  get 'spots/new' => 'spots#new'
  get 'spots/show' => 'spots#show'
  namespace :public do
    #ゲストログインのための記述
    post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
    resources :posts, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    get 'users/unsubscribe' => 'users#unsubscribe'
    patch 'users/withdraw' => 'users#withdraw'
    resources :users, only: [:edit, :show, :update, :index, :destroy] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end  
  end  
  
  namespace :admin do
    resources :posts, only: [:index, :show, :destroy] do
      resources :postcomments, only: [:destroy]
    end 
    resources :users, only: [:show, :index, :update, :edit, :destroy]
    
  end  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
