class PostImage < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  # ↑ 直訳すると"belongs to〜とは「〜に属する」と言う意味。
  # has_manyとは逆に、1:Nの「N」側に当たるモデルに、belongs_toを記載する必要がある。
  # PostImageモデルに関連付けられるのは、1つのUserモデルであるため、単数形の「user」になっている。
end
