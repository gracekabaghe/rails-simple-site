class CommentsController < ActionController::Base
  def create
    # user_post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @new_comment = @post.comments.new(user_id: @user.id, post_id: @post_id, text: comment_params['text'])
    # new_comment = Comment.new(author: user, post: user_post, text: comment_params)

    if @new_comment.save
      # @new_comment.count_comments(@post.id)
      Comment.count_comments(@post.id)
      flash[:success] = 'Your comment has been added!'
      redirect_to user_post_path(@user, @post)
    else
      flash.now[:error] = 'Comment could not be added'
      # render user_post_path(@user, @post)
    end
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.new
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
