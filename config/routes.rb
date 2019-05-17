Rails.application.routes.draw do
  root to: 'pages#home'
  resources :items do
    member do
      get 'buy', to: 'purchases#buy', as: :buy
    end
  end
  devise_for :users
  resources :users do
    resources :reviews, only: [:new, :create, :index, :show, :destroy]
  end
  get 'my_profile', to: 'pages#profile', as: :my_profile
  get 'my_purchases', to: 'pages#purchases', as: :my_purchases
  get 'my_posts', to: 'pages#posts', as: :my_posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
