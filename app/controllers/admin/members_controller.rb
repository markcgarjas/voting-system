class Admin::MembersController < AdminController
  before_action :set_organization
  def new
    @member = @organization.members.new
  end

  def create
    @member = @organization.members.new(user: User.find_by_username(params[:member][:username]))
    if @member.save
      redirect_to organizations_path, notice: 'Member created successfully.'
    else
      flash.now[:alert] = @member.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @member = @organization.members.find(params[:id])
    @member.destroy
    redirect_to organizations_path, notice: 'Member deleted successfully.'
  end

  private

  def set_organization
    @organization = Organization.find(params[:organization_id])
  end
end
