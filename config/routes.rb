Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'
  # ↓ resourcesメソッドを使用して上の３つのルーティングを一括自動生成。
  # ↓ only メソッドを使用することで生成するルーティングを限定している。
  resources :post_images, only: [:new, :index, :show]

  get 'homes/about',as:'about'
end
