class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    

  has_many :nekos, dependent: :destroy 
  has_many :likes, dependent: :destroy
  has_many :liked_nekos, through: :likes, source: :neko
  has_many :comments, dependent: :destroy

  def already_liked?(neko)
    self.likes.exists?(neko_id: neko.id)
  end

  validates :name, presence: true 
  validates :profile, length: { maximum: 200 } 
end
