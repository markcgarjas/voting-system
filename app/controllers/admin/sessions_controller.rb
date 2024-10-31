# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  layout 'admin'

  def create
    user = resource_class.admin.find_by_username("admin_#{params[:admin_user][:username]}")
    if user&.valid_password?(params[:admin_user][:password])
      sign_in :admin_user, user
      flash[:notice] = 'Sign in successfully.'
      redirect_to after_sign_in_path_for(resource_name)
    else
      flash[:alert] = 'Incorrect username or password.'
      redirect_back(fallback_location: admin_root_path)
    end
  end
end
