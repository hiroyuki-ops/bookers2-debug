class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
  attachment :profile_image, destroy: false

  has_many :favorites, dependent: :destroy
  #ユーザーが削除されたときに一緒にいいねも削除されるようにする
  has_many :book_comment

  def already_favorited?(book)
    self.favorites.exists?(book_id: book.id)
  end

  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, presence: true
  validates :name, length: {maximum: 20, minimum: 2}
   validates :introduction, length: { maximum: 50 }
end
