class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Thanks for signing up"
    else
      flash[:alert] = "Fix errors below"
      render :new
    end
  end

  def edit
  end

  def update
    # for first_name, last_name and email
    @user = User.find params[:id]
    binding.pry
    if @user.update user_params
      redirect_to user_path(@user), notice: "success"
    else
      render :edit
      flash[:alert] = "error updating"
    end
  end


  private
  def find_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:first_name,
                                  :last_name,
                                  :email,
                                  :password,
                                  :password_confirmation,
                                  :profile_picture,
                                  :current_company,
                                  :current_position,
                                  :current_website,
                                  :location,
                                  {opportunities_attributes: [:title, :body, :destroy, :id]},
                                  {links_attributes: [:alma_mater,
                                  :academic_discipline,
                                  :specific_discipline,
                                  :specialization,
                                  :topic_of_research,
                                  :level_of_education]})
  end

# UPDATE USER
  def edit_password
  end

  def update_password
    if @user.authenticate(params[:user][:old_password]) && (@user.update user_params)
      redirect_to @user, notice: "Password updated successfully"
    else
      flash[:alert] = "Invalid. Please try again."
      render :update_password
    end
  end
end
