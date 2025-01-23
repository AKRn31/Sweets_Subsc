class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user= current_user
    images = params[:post][:images]
    if images
      images.each do |image|
        @post.images.attach(images)
      end
    end
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
    @post=Post.find(params[:id])
    @user=@post.user.id
    @comment = Comment.new
  end

  

  def edit
    @post=Post.find(params[:id])
    @user=@post.user
    unless @post.user.id == current_user.id
      redirect_to posts_path
    end
  end

  def update
    @post=Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿を保存しました"
      redirect_to post_path(@post.id) 
    else
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
