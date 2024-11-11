class Admin::OfficerPositionsController < AdminController
  before_action :set_officer_position, only: %i[edit update destroy]

  def index
    @officer_positions = OfficerPosition.order(:sort)
  end

  def new
    @officer_position = OfficerPosition.new
  end

  def create
    @officer_position = OfficerPosition.new(officer_position_params)
    if @officer_position.save
      # update_sort
      redirect_to officer_positions_path, notice: 'Officer position was successfully created.'
    else
      flash.now[:alert] = @officer_position.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    new_value = officer_position_params[:sort].to_i
    if @officer_position.update(officer_position_params)
      # update_sort
      redirect_to officer_positions_path, notice: 'Officer position was successfully updated.'
    else
      flash.now[:alert] = @officer_position.errors.full_messages.join(', ')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @officer_position.destroy
    # update_sort
    redirect_to officer_positions_path, notice: 'Officer position was successfully destroyed.'
  end

  private

  def officer_position_params
    params.require(:officer_position).permit(:name, :sort)
  end

  def set_officer_position
    @officer_position = OfficerPosition.find(params[:id])
  end
  # Uncomment the following if needed
  # def update_sort
  #   if OfficerPosition.exists?(sort: @officer_position.sort)
  #     OfficerPosition.where("sort >= ?", @officer_position.sort).where.not(id: @officer_position.id).order(:sort).each_with_index do |officer_position, index|
  #       return unless OfficerPosition.exists?(sort: officer_position.sort + 1)
  #       officer_position.update(sort: officer_position.sort + 1)
  #     end
  #   end
  # end
end
