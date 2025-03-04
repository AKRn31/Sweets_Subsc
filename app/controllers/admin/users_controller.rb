class Admin::UsersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def index
    @users = User.all
  end 

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def update
    @user=User.find(params[:id])
    if @user.update(is_deleted:params[:user][:is_deleted])
      flash[:notice] = "保存しました"
      redirect_to admin_users_path
    else
      flash[:notice] = "失敗しました"
      redirect_to admin_user_path(@user)
    end
  end

end

