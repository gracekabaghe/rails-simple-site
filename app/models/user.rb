class User < ApplicationRecord
  has_many :posts, foreign_key: :user_id
  has_many :comments, foreign_key: :user_id
  has_many :likes, foreign_key: :user_id

  def show_last_5_posts
    Post.order('created_at Desc').limit(3)
  end
end
