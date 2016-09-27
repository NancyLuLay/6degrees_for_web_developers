class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "You have successfully signed up"
    else
      flash[:alert] = "Fix errors below"
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.authenticate(params[:user][:password]) && (@user.update user_params)
      redirect_to @user, notice: "Password updated successfully"
    else
      flash[:alert]="Invalid. Please try again."
      render :edit
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:first_name,
                          :last_name,
                          :email,
                          :password,
                          :password_confirmation,
                          :alma_mater,
                          :academic_discipline,
                          :specific_discipline,
                          :specialization,
                          :topic_of_research,
                          :level_of_education,
                          :current_company,
                          :current_position,
                          :current_website,
                          :opportunities)
  end

end
