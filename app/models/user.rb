class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
 
  has_many :posts
  has_many :comments
  has_many :likes

  validates :name, presence: true
  # validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  def self.recent_post(id)
    Post.where(user_id: id).limit(3)
  end

  def self.all_post(id)
    Post.where(user_id: id)
  end
end
