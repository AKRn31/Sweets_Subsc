class Admin::PostsController < ApplicationController
  layout 'admin'
  def index
    @posts = Post.all
  
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end
end


