Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  root to: 'public/homes#top'
  
  namespace :public do
    resources :posts, only: [:new, :index, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    get 'users/my_page' => 'users#show'
    
  end  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
