# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
#before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    subscs_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

    private

    def user_state
      user = User.find_by(email: params[:username][:email])
      return if customer.nil?
        return unless customer.valid_password?(params[:customer][:password])
        if  user.is_deleted == true
          redirect_to new_user_registration_path
        else
          flash[:notice] = "該当するユーザーが見つかりません"
        end
      end
   
    protected
  
    #def configure_permitted_parameters
          #devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password])
          #devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
    #end
  end




