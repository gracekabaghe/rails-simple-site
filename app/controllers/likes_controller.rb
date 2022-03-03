class LikesController < ActionController::Base
  def create
    user_post = Post.find(params[:post_id])
    user = User.find(params[:user_id])
    @like = Like.create(user_id: user.id, post_id: user_post.id)
    if @like.save
      Like.count_likes(user_post.id)
      flash[:success] = 'Great! your like has been added!'

    else
      flash.now[:error] = 'Sorry! Like could not be added'
    end
    redirect_to user_post_path(user.id, user_post.id)
  end
end
