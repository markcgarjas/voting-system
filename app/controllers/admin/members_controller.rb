# frozen_string_literal: true

module Admin
  class MembersController < AdminController
    before_action :set_organization
    before_action :set_member, only: %i[edit update destroy]

    def new
      @member = @organization.members.new
    end

    def create
      @member = @organization.members.new(member_params)
      if @member.save
        redirect_to organizations_path, notice: 'Member created successfully.'
      else
        flash.now[:alert] = @member.errors.full_messages.join(', ')
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @member.update(member_params)
        redirect_to organizations_path, notice: 'Member updated successfully.'
      else
        flash.now[:alert] = @member.errors.full_messages.join(', ')
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @member.destroy
      redirect_to organizations_path, notice: 'Member deleted successfully.'
    end

    private

    def set_organization
      @organization = Organization.find(params[:organization_id])
    end

    def set_member
      @member = @organization.members.find(params[:id])
    end

    def member_params
      params.require(:member).permit(:name, :user_id, :officer_position_id)
    end
  end
end
