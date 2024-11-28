# frozen_string_literal: true

module Students
  class RegistrationsController < Devise::RegistrationsController
    include LoginVerifier
    def create
      super
      save_session_token(resource)
    end

    private

    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :email, :username, :phone_number, :password,
                                   :password_confirmation)
    end
  end
end
