Rails.application.routes.draw do
 devise_for :users
 root to: "homes#top"


 resources :books, only: [:edit, :index, :show, :create, :update, :destroy, :delete]
 resources :users, only: [:show, :index, :edit, :update, :create, :destroy, :delete]
 get 'home/about' => 'homes#about'

end
