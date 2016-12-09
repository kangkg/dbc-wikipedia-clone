class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @errors = @user.errors.full_messages
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @categories = Category.all
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.role == 'user' ? @user.role = 'admin' : @user.role = 'user'
    @user.save
    respond_to do |format|
        format.html { redirect_to @user }
    end
  end

  private

  def user_params
    params_hash = params.require(:user).permit(:username, :password)
    params_hash[:role] = 'user'
    params_hash
  end
end
