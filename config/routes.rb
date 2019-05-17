Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :items do
    member do
      get 'buy', to: 'purchases#buy', as: :buy
    end
  end
  get 'my_profile', to: 'pages#profile', as: :my_profile
  get 'my_purchases', to: 'pages#purchases', as: :my_purchases
  get 'my_posts', to: 'pages#posts', as: :my_posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
