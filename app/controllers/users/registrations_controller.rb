# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super
    self.resource = resource_class.new(sign_up_params)
    resource.save
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :phone_number, :password, :password_confirmation)
  end
end
