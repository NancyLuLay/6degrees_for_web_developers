class PostsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    post_params = params.require(:post).permit([:post_title, :post_body])
    @post = Post.create post_params
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post.id)
    else render :new
    end
  end

  def show
    @post = Post.find params[:id]
    @comment = Comment.new
  end

  def index
    @posts = Post.order(created_at: :desc)
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    if @post.update params.require(:post).permit([:post_title, :post_title])
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find params[:id]
    post.destroy
    redirect_to posts_path
  end

end
