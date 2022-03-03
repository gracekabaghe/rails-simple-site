class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.count_comments(id)
    post = Post.find(id)
    post.comments_counter = Comment.where(post_id: id).count
    post.save
  end
end
