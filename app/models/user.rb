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
end
