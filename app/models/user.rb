class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_manyでは何をたくさん持っているかを記述（今回ならbook）
  has_many :books, dependent: :destroy
end
