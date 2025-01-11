class Public::UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @posts=@user.posts
  end

  def edit
    @user=User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "保存しました"
    redirect_to user_path
    else
      render :edit
    end
  end

  def confirm
    @user = User.find(current_user.id)
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
