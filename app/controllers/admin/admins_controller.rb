class Admin::AdminsController < AdminController
  before_action :set_admin, only: %i[edit update destroy]

  def index
    @admins = User.admin.order(:created_at)
  end

  def new
    @admin = User.new
  end

  def create
    @admin = User.new(admin_params.merge(username: params[:user][:username],
                                         role: :admin,
                                         password: "qwer4321`"))
    if @admin.save
      redirect_to admins_path, notice: 'Admin created successfully'
    else
      flash.now[:alert] = @admin.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    @admin.update(admin_params)
    if @admin.save
      redirect_to admins_path, notice: 'Admin updated successfully'
    else
      flash.now[:alert] = @admin.errors.full_messages.join(', ')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @admin == current_admin_user
      redirect_to admins_path, alert: 'You cannot delete your own account.'
    else
      @admin.destroy
      redirect_to admins_path, notice: 'Admin deleted successfully'
    end
  end

  private

  def admin_params
    params.require(:user).permit(:email, :username)
  end

  def set_admin
    @admin = User.find(params[:id])
  end
end
