# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
#before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    subscs_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to posts_path, notice: 'ゲストユーザーとしてログインしました。'
  end

    private

    def user_state
      user = User.find_by(email: params[:username][:email])
      if user.nil?
        flash[:notice] = "該当するユーザーが見つかりません"
      else
        unless user.valid_password?(params[:username][:password])
          flash[:notice] = "パスワードが違います"
        else
          if user.is_deleted
            redirect_to new_user_registration_path
          else
            redirect_to subscs_path
          end
      end
    end

  def create
    user = User.find_by(email: params[:email])
  
      if user && user.authenticate(params[:password])
        if user.is_deleted?
          flash[:alert] = "アカウントが削除されているためログインできません。"
          redirect_to login_path
        else
          redirect_to subscs_path
        end
      else
        flash[:alert] = "メールアドレスまたはパスワードが間違っています。"
        redirect_to login_path
      end
  end

   
    protected
  
    #def configure_permitted_parameters
          #devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password])
          #devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
    #end
  end

end


