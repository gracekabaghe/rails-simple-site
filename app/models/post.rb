class Post < ApplicationRecord
  has_many :likes
  has_many :comments

  belongs_to :author, class_name: 'User', foreign_key: :user_id

  def load_recent_five_comments
    Comment.order('created_at Desc').limit(5)
  end

  after_save :update_posts_counter

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end