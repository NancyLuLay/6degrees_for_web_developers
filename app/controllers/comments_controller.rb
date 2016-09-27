class CommentsController < ApplicationController
  before_action :authenticate_user!, only:[:create, :destroy]
  before_action :authorize!, only:[:edit, :update, :destroy]

  def create
    @comment = Comment.new params.require(:comment).permit(:comment_body)
    @post = Post.find params[:post_id]
    @comment.post = @post
    @comment.user = current_user
      if @comment.save
        redirect_to post_path(@post), notice: "Comment Created"
      else
        flash[:alert] = "Please fix errors below"
      end
  end

  def destroy
    post = Post.find params[:post_id]
    comment = Comment.find params[:id]
    comment.destroy
      redirect_to post_path(post), notice: "Comment deleted"
  end

  def authorize!
    redirect_to root_path, alert: "Access denied" unless can? :manage, @comment
  end

end
