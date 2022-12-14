class PostImage < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  # ↑ 直訳すると"belongs to〜とは「〜に属する」と言う意味。
  # has_manyとは逆に、1:Nの「N」側に当たるモデルに、belongs_toを記載する必要がある。
  # PostImageモデルに関連付けられるのは、1つのUserモデルであるため、単数形の「user」になっている。

  has_many :post_comments,dependent: :destroy
  # ↑ PostImageモデルとPostCommentモデルとの関連付け。1:Nの関係を実装。

  # ↓ 画像が設定されていない場合はapp/assets/imagesに格納されているno_image.jpgという画像をデフォルト画像としてActiveStorageに格納し、格納した画像を表示する。

  has_many :favorites,dependent: :destroy

  validates :shop_name, presence: true
  validates :image, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  # ↓ favorited_by?メソッドを作成。引数で渡されたユーザidがfavoritesテーブル内に存在(exists?)するかどうかを調べる。
  # 存在していればtrue、存在していなければfalseを返すようにしている。
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
