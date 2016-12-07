class LikesController < ApplicationController
	before_action :authenticate_user!

	def create
		post = Post.find params[:post_id]
    like = Like.new user: current_user, post: post
	  if !(can? :like, post)
    	redirect_to root_path, alert: "access denied"
    elsif like.save
			redirect_to posts_path
    else
      redirect_to posts_path
    end

	end

	def destroy
		post = Post.find params[:post_id]
    like = Like.find params[:id]
    if can? :destroy, like
      like.destroy
    redirect_to posts_path, notice: "Like removed!"
    else
    	redirect_to posts_path
		end
	end

end
