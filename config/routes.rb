Rails.application.routes.draw do
  get 'users/show'
  get 'likes/index'
  post :incoming, to: 'incoming#create'

  resources :topics do
    resources :bookmarks do
      resources :likes, only: [:index, :create, :destroy]
    end
  end

  devise_for :users

  resources :users, only: [:show]
  
  # get '/welcome_email'
  get '/welcome/index'
  get '/welcome/about'

  root to: 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
