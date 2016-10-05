class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_email(params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Signed In"
    else
      flash[:alert] = "Wrong Credentials"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed Out"
  end

end
