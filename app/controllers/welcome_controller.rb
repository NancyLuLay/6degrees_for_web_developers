class WelcomeController < ApplicationController
  def index
    @user = User.new
    if params["user"] == nil
      @users = User.tagged_with((""), :any => true)
    else
      @users = User.tagged_with((params["user"]["tag_ids"]), :any => true)
      @params = params["user"]["tag_ids"].drop(1).split.join(", ")
    end
    @markers = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow marker_info_window(user)
    end
  end

  private

    def marker_info_window(user)
      "<img width='50%' align='left' src=#{user.profile_picture.url(:version_profile_image)} />" + "<a margin-right='5px' href='#{user_path(user)}'>#{user.full_name}</a>".html_safe + "<br/>" +"#{user.current_position}" + " at " + "#{user.current_company}"
    end

end
