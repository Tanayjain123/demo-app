class UsersController < ApplicationController
  def index
    @user = User.all
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to  new_user_post_path(@user,@post)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end


  private
  def user_params
   params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
end
