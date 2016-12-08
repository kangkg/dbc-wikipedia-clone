class SessionsController < ApplicationController

  def create
    @user = User.find_by(username: params[:sessions][:username])

    if @user && @user.authenticate(params[:sessions][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @errors = ['Invalid combination']
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
