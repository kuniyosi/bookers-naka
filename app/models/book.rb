class Book < ApplicationRecord

  has_one_attached :image

  # 1:Nの「N」側にbelongs_toを記述する
  belongs_to :user

end
