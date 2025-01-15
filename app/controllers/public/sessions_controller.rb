# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    subscs_path
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

  end
