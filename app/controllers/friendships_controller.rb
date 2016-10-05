class FriendshipsController < ApplicationController

  def create
    @user = current_user
    @friendship = current_user.friendships.build(:follower_id => params[:follower_id])
    if @friendship.save
      flash[:notice] = "You are now following this person"
      redirect_to user_path(current_user)
    else
      flash[:error] = "Unable to follow"
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "You have unfollowed this person"
    redirect_to user_path(current_user)
end
