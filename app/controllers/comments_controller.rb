class CommentsController < ApplicationController
  before_action :authenticate_user!, only:[:create, :destroy]
  before_action :authorize!, only:[:edit, :update, :destroy]

  def create
    @comment = Comment.new params.require(:comment).permit(:comment_body)
    @post = Post.find params[:post_id]
    @comment.post = @post
    @comment.user = current_user
      if @comment.save
        redirect_to posts_path
      else
        flash[:alert] = "Please fix errors below"
      end
  end

  def update
    post = Post.find params[:id]
    comment = Comment.find params[:id]
    byebug
    comment.update_attribute(:comment_body, params[:comment][:comment_body])
  end

  def destroy
    post = Post.find params[:post_id]
    comment = Comment.find params[:id]
    comment.destroy
      redirect_to posts_path, notice: "Comment deleted"
  end

  def authorize!
    @comment = Comment.find params[:id]
    redirect_to root_path, alert: "Access denied" unless can? :manage, @comment
  end

end
