class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user= current_user
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def index
    @posts = Post.all
   
  end

  def show
    @post=Post.find(params[:id])
    @user=@post.user.id
  end

  

  def edit
    @post=Post.find(params[:id])
    unless @post.user.id == current_user.id
      redirect_to posts_path
    end

  end

  def update
    @post=Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "You have updated post successfully."
      redirect_to posts_path(@post.id) 
    else
      render :edit
    end
  end

  def destroy
    post=Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :subsc_id, image: [])
  end
end
