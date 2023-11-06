class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :kinous, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_kinous, through: :likes, source: :kinou
  has_many :comments, dependent: :destroy

  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 }

  def already_liked?(kinou)
    self.likes.exists?(kinou_id: kinou.id)
  end
end
