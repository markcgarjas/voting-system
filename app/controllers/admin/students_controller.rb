class Admin::StudentsController < AdminController
  def index
    @students = User.student.order(:created_at)
    @students = @students.search_data(search_param) if search_param
  end
end
