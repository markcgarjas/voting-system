class Admin::StudentsController < AdminController
  def index
    @students = User.student.order(:created_at)
  end
end
