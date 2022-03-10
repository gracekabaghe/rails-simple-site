class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @id = params[:id]
    @user = User.find(@id)
    @posts = User.recent_post(@id)
  end

  def new
    @message = Message.new
  end
end
