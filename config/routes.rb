Rails.application.routes.draw do
  
  namespace :admin do
    get 'homes/top'
  end
  devise_for :admin, skip: [:registrations,:password], controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    root to: "homes#top"
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
    resources :subscs
  end

  scope module: :public do
    devise_for :users, controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }
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

