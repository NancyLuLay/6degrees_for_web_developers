class CallbacksController < ApplicationController
  def linkedin
    user = User.find_or_create_from_linkedin request.env['omniauth.auth']
    session[:user_id] = user.id
    redirect_to user_path(current_user)
  end
end
