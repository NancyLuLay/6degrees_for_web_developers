class CommentsController < ApplicationController
  before_action :authenticate_user!, only:[:create, :destroy]
  before_action :authorize!, only:[:edit, :update, :destroy]

  def create
    @comment = Comment.new params.require(:comment).permit(:comment_body)
    @post = Post.find params[:post_id]
    @comment.post = @post
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html {redirect_to posts_path}
        format.js {render :create_success}
      else
        flash[:alert] = "Please fix errors below"
        format.html {render "/posts/index"}
        format.js {render :create_failure}
      end
    end
  end

  # def update
  #   post = Post.find params[:id]
  #   comment = Comment.find params[:id]
  #   byebug
  #   comment.update_attribute(:comment_body, params[:comment][:comment_body])
  # end

  def destroy
    @post = Post.find params[:post_id]
    @comment = Comment.find params[:id]
    @comment.destroy
    respond_to do |format|
      format.html {redirect_to posts_path, notice: "Comment deleted"}
      format.js {render}
    end
  end

  def authorize!
    @comment = Comment.find params[:id]
    redirect_to root_path, alert: "Access denied" unless can? :manage, @comment
  end

end
