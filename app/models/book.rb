class Book < ApplicationRecord

  # 1:Nの「N」側にbelongs_toを記述する
  belongs_to :user

  validates :title, presence: true
  #  presence: trueで空の投稿を禁止
  validates :body, presence: true,length:{maximum:200}
  # length:{maximum:200}で200文字以下の文字数制限
end
