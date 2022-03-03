class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def self.recent_post(id)
    Post.where(user_id: id).limit(3)
  end

  def self.all_post(id)
    Post.where(user_id: id)
  end
end
