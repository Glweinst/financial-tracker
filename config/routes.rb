Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  root 'users#my_portfolio'
  get 'welcome', to: 'welcome#index'
  get 'search_stocks', to: 'stocks#search'
  resources :user_stocks, only: [:create, :destroy]
  get 'my_friends', to: 'users#my_friends'
  
end
