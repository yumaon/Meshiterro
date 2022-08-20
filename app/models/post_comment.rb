class PostComment < ApplicationRecord
  # ↓ UserモデルとPostImageモデルを関連付ける。両方関連付けられるのは一つのため、belongs_toを記述。
  belongs_to :user
  belongs_to :post_image
end
