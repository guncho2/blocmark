Rails.application.routes.draw do



  resources :topics

  resources :bookmarks do

    get 'bookmarks/index'
    get 'bookmarks/show'
    get 'bookmarks/new'
    get 'bookmarks/edit'

post 'topics/show'
  get 'topics/index'
  get 'topics/show'
  get 'topics/new'
  get 'topics/edit'
end

  devise_for :users
  get 'welcome/index'
  get 'welcome/about'

  root 'welcome#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
