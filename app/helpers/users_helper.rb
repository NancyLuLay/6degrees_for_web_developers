module UsersHelper
  def user_markers_builder(user)
    following = user.following.to_a
    following.push(user).map do |u|
      {
        "lat": u.latitude,
        "lng": u.longitude,
        "infowindow":
          "<img border='0' margin-right='10px' width='50%' align='left' src='#{u.profile_picture}'>
          #{link_to u.full_name, user_path(u)}
          <br/>
          #{u.current_position} at #{u.current_company}"
      }
    end
  end

  def line_coordinates_lat_lng(user)
    user.following.map do |f|
      [{lat: user.latitude, lng: user.longitude},
      {lat: f.latitude, lng: f.longitude}]
    end.flatten
  end


end
