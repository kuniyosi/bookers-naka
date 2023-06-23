class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_manyでは何をたくさん持っているかを記述（今回ならbook）
  has_many :books, dependent: :destroy

  has_one_attached :profile_image

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }, uniqueness: true
  # ２文字以上２０字以内で制限、uniquenessでnemeに一意性を持たせる。
  validates :introduction, length:{ maximum: 50 }
  # 空の投稿は許可するのでpresence: trueは書かない

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/No_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
     profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
