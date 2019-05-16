Rails.application.routes.draw do

post :incoming, to: 'incoming#create'

  resources :topics do
    resources :bookmarks
end

  devise_for :users
  

  root to: 'welcome#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
