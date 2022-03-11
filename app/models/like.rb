class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  def self.count_likes(id)
    post = Post.find(id)
    post.likes_counter = Like.where(post_id: id).count
    post.save
  end

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
