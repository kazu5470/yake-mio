Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  get 'posts/new'
  get 'posts/show'
  get 'posts/edit'
  get 'posts/index'
  get 'users/show'
  get 'users/edit'
  get 'users/unsubscribe'
  get 'users/withdraw'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
