Rails.application.routes.draw do
scope module: :public do
  devise_for :users
  root to: "homes#top"

  resources :posts do
    resources :comments, only:[:create, :destroy]
    get 'images', to: 'posts#image'
  end
    
  resources :users, only:[:show, :edit, :update] do
    get 'confirm'
    patch  'withdraw'
  end
  resources :subscs, only:[:index, :show]
  get '/search', to: 'searches#search'
end  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

