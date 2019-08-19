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
      flash[:error] = "Username required."
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events.all
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
