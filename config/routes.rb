Rails.application.routes.draw do
  
  devise_for :users
  root to: "homes#top"

  resources :posts 
  resources :subscs, only:[:index, :show]
  resources :comments, only:[:new, :create, :destroy]
  get  '/users/:id' => 'users#show', as: 'user'
  get  '/users/:id/edit' => 'users#edit', as: 'edit_user'
  patch  '/users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'
  get  '/users/confilm' => 'users#confilm'
  patch  '/users/withdraw' => 'users#withdraw'
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

