Rails.application.routes.draw do
  get 'users/show'
  get 'users/update'
  get 'users/destroy'
  get 'users/confilm'
  devise_for :users
  root to: "homes#top"
  get 'homes/about'=>'homes#about', as: 'about'

  resources :posts 
  resources :subscs, only:[:index, :show]
  resources :comments, only:[:new, :create, :destroy]
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

