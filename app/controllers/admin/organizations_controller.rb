class Admin::OrganizationsController < AdminController
  before_action :set_organization, only: %i[edit update destroy]

  def index
    @organizations = Organization.all
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
    @organization.destroy
    redirect_to organizations_path, notice: 'Organization was successfully destroyed.'
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :code)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end
end