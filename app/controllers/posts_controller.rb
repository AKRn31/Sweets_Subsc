class PostsController < ApplicationController
  def new
    @post=Post.new
    @user=current_user
  end

  def index
    @posts=Post.all
    @post=Post.find(params[:id])
    @user=@post.user
  end

  def show
    @post=Post.find(params[:id])
    @user=@post.user
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :name, :image)
  end

end
