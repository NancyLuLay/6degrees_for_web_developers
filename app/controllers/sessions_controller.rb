class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_email(params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      flash[:notice] = "Signed In"
      redirect_to root_path
    else
      redirect_to root_path, alert: "Incorrect email or password"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Signed Out"
    redirect_to root_path
  end

end
