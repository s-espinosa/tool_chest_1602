class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "Successfully created user."
      session[:user_id] = @user.id
      redirect_to tools_path
    else
      render new_user_path
    end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
  end
end
