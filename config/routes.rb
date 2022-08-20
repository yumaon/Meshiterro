Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'
  # ↓ resourcesメソッドを使用して上の３つのルーティングを一括自動生成。
  # ↓ only メソッドを使用することで生成するルーティングを限定している。
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy]
  end
  # ↑ コメントは、投稿画像に対してコメントされる。このため、post_commentsは、post_imagesに結びつく。親子関係になる。
  # rails routes にてURLを確認。post_image_post_comments POST   /post_images/:post_image_id/post_comments(.:format)
  # 親のresourcesで指定したコントローラ名に、子のresourcesで指定したコントローラ名が続くURLが生成される。このような親子関係を、「ネストする」という。
  # 上記のようなネストしたURLを作成することでparams[:post_image_id]でPostImageのidを取得できるようになる。

  # get 'users/show'
  # get 'users/edit'
  # ↓ resourcesメソッドを使用して上の2つのルーティングを一括自動生成。
  # ↓ only メソッドを使用することで生成するルーティングを限定している。
  resources :users, only: [:show, :edit, :update]

  get 'homes/about',as:'about'
end
