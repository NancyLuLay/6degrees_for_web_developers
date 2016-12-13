class PostsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]
  before_action :authorize!, only:[:edit, :update, :destroy]

  def create
    @post = Post.new post_params
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html {redirect_to posts_path}
        format.js {render :create_success}
      else
        format.html {redirect_to posts_path}
        format.js {render :create_failure}
      end
    end
  end

  def index
    @post = Post.new
    @comment = Comment.new
  end

  def edit
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attribute(:post_body, params[:post][:post_body])
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    respond_to do |format|
      format.html {redirect_to posts_path}
      format.js {render}
    end
  end

  private
  def authorize!
    @post = Post.find params[:id]
    redirect_to root_path, alert: "Access denied" unless can? :manage, @post
  end

  def post_params
    params.require(:post).permit([:post_body, :post_image])
  end

end
