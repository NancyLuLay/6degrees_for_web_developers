class PostsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]
  before_action :authorize!, only:[:edit, :update, :destroy]

  def create
    @post = Post.new post_params
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post.id)
    else render :show
    end
  end

  # def show
  #   @post = Post.find params[:id]
  #   @comment = Comment.new
  # end

  def index
    @post = Post.new
    @posts = Post.order(created_at: :desc)
  end

  # def edit
  #   @post = Post.find params[:id]
  # end
  #
  # def update
  #   @post = Post.find params[:id]
  #   if @post.update post_params
  #     redirect_to post_path(@post)
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   post = Post.find params[:id]
  #   post.destroy
  #   redirect_to posts_path
  # end

  def authorize!
    redirect_to root_path, alert: "Access denied" unless can? :manage, @post
  end

  def post_params
    params.require(:post).permit([:post_title, :post_body, :post_image])
  end
end
