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

  devise_scope :user do
    get 'users/sign_in' => 'devise/sessions#new'
    get 'users/sign_out' => 'devise/sessions#destroy'
  end


  resources :users, only: [:show]

  match 'users/show/:id', to: 'users#show', via: 'get'

  # get '/welcome_email'
  get '/welcome/index'
  get '/welcome/about'

  root to: 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
