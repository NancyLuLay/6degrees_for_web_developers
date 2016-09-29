class WelcomeController < ApplicationController
  def index
    @users = User.all.where.not(latitude: nil, longitude: nil)
    @markers = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow user.full_name
    end
  end
end
