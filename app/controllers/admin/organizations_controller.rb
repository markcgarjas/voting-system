# frozen_string_literal: true

module Admin
  class OrganizationsController < AdminController
    before_action :set_organization, only: %i[edit update destroy]

    def index
      @organizations = Organization.includes(members: %i[user officer_position]).search_data(search_param)
      @organizations = @organizations.page(params[:page]).per(2)
    end

    def new
      @organization = Organization.new
    end

    def create
      @organization = Organization.new(organization_params)
      if @organization.save
        redirect_to organizations_path, notice: 'Organization was successfully created.'
      else
        flash.now[:alert] = @organization.errors.full_messages.join(', ')
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      @organization.update(organization_params)
      if @organization.save
        redirect_to organizations_path, notice: 'Organization was successfully updated.'
      else
        flash.now[:alert] = @organization.errors.full_messages.join(', ')
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      if @organization.destroy
        flash[:notice] = 'Organization was successfully destroyed.'
      else
        flash[:alert] = @organization.errors.full_messages.join(', ')
      end
      redirect_to organizations_path
    end

    private

    def organization_params
      params.require(:organization).permit(:name, :code)
    end

    def set_organization
      @organization = Organization.find(params[:id])
    end
  end
end
