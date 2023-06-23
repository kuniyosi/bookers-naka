class Book < ApplicationRecord

  # 1:Nの「N」側にbelongs_toを記述する
  belongs_to :user

end
