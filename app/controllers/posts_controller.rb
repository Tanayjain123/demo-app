class PostsController < ApplicationController
  def index
    @post = User.find(params[:user_id]).posts
  end
  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.new
  end
  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.build(post_params)
    if @post.save
      redirect_to user_post_comments_path(@user,@post)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])

  end


  private
  def post_params
    params.require(:post).permit(:body, :author, :published)
  end
end
