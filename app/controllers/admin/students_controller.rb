class Admin::StudentsController < AdminController
  before_action :set_student, only: %i[show edit update destroy]

  def index
    @students = User.student.order(:created_at)
    @students = @students.search_data(search_param) if search_param
  end

  def new
    unless cookies[:password]
      cookies[:password] = SecureRandom.alphanumeric(18)
    end

    @student = User.student.new
  end

  def create
    @student = User.student.new(student_params.merge(password: cookies[:password]))
    if @student.save
      cookies.delete(:password)
      redirect_to students_path, notice: 'Student created successfully.'
    else
      flash.now[:alert] = @student.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @student.update(student_params)
      redirect_to student_path(@student), notice: 'Student updated successfully.'
    else
      flash.now[:alert] = @student.errors.full_messages.join(', ')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student.destroy
    redirect_to students_path, notice: 'Student deleted successfully.'
  end

  private

  def student_params
    params.require(:user).permit(:username, :email)
  end

  def set_student
    @student = User.student.find(params[:id])
  end
end
