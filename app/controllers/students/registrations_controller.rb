# frozen_string_literal: true

module Students
  class RegistrationsController < Devise::RegistrationsController
    include LoginVerifier

    def create
      build_resource(sign_up_params)
      if resource.save
        sign_up(resource_name, resource)
        save_session_token(resource)
        redirect_to student_root_path, notice: "Hi, welcome #{resource.username}!"
      else
        flash[:alert] = resource.errors.full_messages.join(', ')
        render :new, status: :unprocessable_entity
      end
    end

    private

    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :email, :username, :phone_number, :password,
                                   :password_confirmation)
    end
  end
end
