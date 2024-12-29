Rails.application.routes.draw do
  
  devise_for :users
  root to: "homes#top"
  get 'homes/about'=>'homes#about', as: 'about'

  resources :posts 
  resources :subscs, only:[:index, :show]
  resources :comments, only:[:new, :create, :destroy]
  resources :users, only:[:show, :update, :destroy, :confilm]
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

