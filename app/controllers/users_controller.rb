class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = user_params[:password]
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @errors = @user.errors.full_messages
      render "new"
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
