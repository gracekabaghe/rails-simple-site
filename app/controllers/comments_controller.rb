class CommentsController < ActionController::Base
  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @new_comment = @post.comments.new(user_id: @user.id, post_id: @post_id, text: comment_params['text'])

    if @new_comment.save
      Comment.count_comments(@post.id)
      flash[:success] = 'Great! Your comment has been added!'
      redirect_to user_post_path(@user, @post)
    else
      flash.now[:error] = 'Sorry! comment could not be added'
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
