class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "User created"
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    if logged_in?
      @user = current_user
      @events = @user.events.all
    else
      flash[:danger] = "You are not logged in!"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
