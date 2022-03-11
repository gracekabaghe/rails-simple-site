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
   after_create :generate_api_token

  def self.recent_post(id)
    Post.where(user_id: id).limit(3)
  end

  def self.all_post(id)
    Post.where(user_id: id)
  end

  def generate_api_token
    self.apitoken = Devise.friendly_token
    save
  end
end
