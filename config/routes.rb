Rails.application.routes.draw do
 
  devise_for :admin, skip: [:registrations,:password], controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    root to: "homes#top"
    resources :subscs
    resources :users, only: [:index, :show, :destroy,:update]
    resources :posts, only: [:index, :destroy]
  end
  devise_for :users, controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }
    devise_scope :user do
      post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
    end

  scope module: :public do
    get 'search', to: 'searches#search', as: 'search'
    root to: "homes#top"
    resources :subscs, only:[:index, :show, :create, :update, :destroy]
    

    resources :posts do
      resources :comments, only:[:create, :destroy]
      get 'images', to: 'posts#image'
    end
    
    resources :users, only:[:show, :edit, :update] do
      get 'confirm'
      patch  'withdraw'
    end

    
  end  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

