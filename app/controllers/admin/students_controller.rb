class Admin::StudentsController < AdminController
  def index
    @students = User.student.order(:created_at)
    @students = @students.search_data(params[:search]) if params[:search].strip!
  end
end
