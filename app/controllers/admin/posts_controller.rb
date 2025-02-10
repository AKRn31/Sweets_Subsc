class Admin::PostsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def index
    @posts = Post.all
  
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to admin_posts_path(@post), notice: '投稿を削除しました'
    else
      redirect_to admin_posts_path(@post), alert: '投稿の削除に失敗しました'
    end
  end
end


