class Public::PostsController < ApplicationController
  before_action :guest_check, only: [:new, :create, :edit, :update, :destroy]

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user= current_user
    images = params[:post][:images]
    #if images
    #  images.each do |image|
    #    @post.images.attach(image)
    #  end
    #end
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to @post
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @posts = Post.all
    @post=Post.find(params[:id])
    @user=@post.user.id
    @comment = current_user.comments.new
  end

  

  def edit
    @post=Post.find(params[:id])
    @user=@post.user
    unless @post.user.id == current_user.id
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if params.dig(:post, :image_ids)&.any?
      params[:post][:image_ids].each do |image_id|
        image = @post.images.find(image_id)
        image.purge
      end
    end
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "更新に成功しました。"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    post=Post.find(params[:id])
    post.destroy
    flash[:notice] = "削除しました"
    redirect_to user_path(current_user.id)
  end


  private

  def post_params
    params.require(:post).permit(:title, :body, :subsc_id, images: [])
  end
end
