class UsersController < ApplicationController
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
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
  end

  def confilm
    
  end

  def withdraw
    
  end
  

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
