class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ↓ UserモデルにPostImageモデルを関連付ける。Userモデルに対して、PostImegeモデルが1:Nになるよう関連付ける。
  # 1:Nの「1」側にあたるモデルに、has_manyを記載する必要がある。
  # dependent: :destroyの記述は、「1:Nの1側が削除された時、N側を全て削除するという機能の追加。
  # ほとんどの場合 has_manyにはdependent: :destroyをつけて実装する。
  has_many :post_images, dependent: :destroy

  has_one_attached :profile_image
  # ↑ has_one_attached :profile_imageという記述により。profile_imageという名前でActiveStorageでプロフィール画像を保存できるように設定。

  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path),filename: 'default-image.jpg', content_type: 'image/jpeg')
      # ↑ get_profile_imageというメソッドの内容は、画像が設定されない場合はapp/assets/imagesに格納されているsample-authot1.jpgという
      # ↑ 画像をデフォルト画像としてActiveStotageに格納し、格納した画像を表示するというものです。
    end
    # profile_image.variant(resize_to_limit: [100,100]).processed
    # ↑ 画像のサイズ変換を行っている。しかし上記だと100x100の画像にサイズを変換することしかできないため、記載を下記コードに変更。

    profile_image.variant(resize_to_limit: [width, height]).processed
    # ↑ メソッドに対して引数を設定し、引数に設定した値に画像のサイズを変換するようにした。
    # ↑ ex.. get_profile_image(200,200)のように引数を設定すると200x200の画像にリサイズが行われる。
  end
end
