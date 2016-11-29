class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]
  before_action :user_signed_in?, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]

  FOLLOWING_PER_PAGE = 6
  FOLLOWERS_PER_PAGE = 6

  def new
    @user = User.new
  end

  def show

  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    # for first_name, last_name and email
    @user = User.find params[:id]
    if @user.update user_params
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
# edit forms for profile
  def edit_profile
    @user = User.find params[:id]
  end

  def update_profile
    if @user.update user_params
      redirect_to user_path(@user)
    else
      render :edit_profile
    end
  end

  def edit_experience
    @user = User.find params[:id]
    1.times{@user.experiences.build}
  end

  def update_experience
    if @user.update user_params
      redirect_to user_path(@user)
    else
      render :edit_experience
    end
  end

  def edit_project
    @user = User.find params[:id]
    1.times{@user.projects.build}
  end

  def update_project
    if @user.update user_params
      redirect_to user_path(@user)
    else
      render :edit_project
    end
  end

  def edit_opening
    @user = User.find params[:id]
    1.times{@user.openings.build}
  end

  def update_opening
    if @user.update user_params
      redirect_to user_path(@user)
    else
      render :edit_opening
    end
  end

  # following
  def following
  #  @title = "Following"
   @user  = User.find(params[:id])
   @users = @user.following.page(params[:page]).per(FOLLOWING_PER_PAGE)
   render 'show_follow'
 end

 def followers
  #  @title = "Followers"
   @user  = User.find(params[:id])
   @users = @user.followers.page(params[:page]).per(FOLLOWERS_PER_PAGE)
   render 'show_follow'
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
                                  :summary,
                                  :github,
                                  :phone_number,
                                  *User::TAG_CONTEXTS.map{|tc| {"#{tc}_list" => []}},
                                  {experiences_attributes:[:title, :body, :destroy, :id]},
                                  {projects_attributes:[:title, :body, :location, :source_code, :project_url, :project_image, :time_period, :destroy, :id]},
                                  {openings_attributes:[:title, :body, :destroy, :id]}
                                  )
  end

end
