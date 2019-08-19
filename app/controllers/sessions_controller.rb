class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user.nil?
      flash.now[:danger] = "User does not exist."
      render :new
    else
      log_in(user)
      redirect_to profile_path
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
