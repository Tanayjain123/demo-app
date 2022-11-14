class CommentsController < ApplicationController
  def index
    @comment = Post.find(params[:post_id]).comments
  end
  def new
   @user = User.find(params[:user_id])
   @post = @user.posts.find(params[:post_id])
   @comment = @post.comments.new
  end
  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    if @comment.save
      redirect_to user_post_comment_path(@user,@post,@comment)
    else
      render 'new'
    end

  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = @user.comments.find(params[:id])
  end

  private
  def comment_params

    params.require(:comment).permit(:author, :body, :replycomment_id)

  end

end
