class WelcomeController < ApplicationController
  def index
    # @users = User.all.where.not(latitude: nil, longitude: nil)
    # @search = User.search(params[:query])
    # @user = User.new
    # @tag = Tag.all
    # @users = User.tagged_with("value"), :any => true).where.not(latitude: nil, longitude: nil)

    @markers = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow user.full_name
    end
  end

  # def self.search(keyword)
  #   where(["name ILIKE ? OR email ILIKE ? OR department ILIKE ? OR message ILIKE ?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  # end

end
