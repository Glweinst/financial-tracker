Rails.application.routes.draw do
  
  devise_for :users
  root 'users#my_portfolio'
  get 'welcome', to: 'welcome#index'
  get "search_stocks", to: 'stocks#search'
  resources :user_stocks, only: [:create, :destroy]
  
end
