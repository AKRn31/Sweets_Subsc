Rails.application.routes.draw do
scope module: :public do
  devise_for :users
  root to: "homes#top"

  resources :posts 
  resources :subscs, only:[:index, :show]
  resources :comments, only:[:new, :create, :destroy]
  resources :users, only:[:show, :edit, :update] do
    get 'confirm'
    patch  'withdraw'
  end
  get '/search', to: 'searches#search'
end  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

