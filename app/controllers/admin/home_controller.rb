class Admin::HomeController < AdminController
  def index
    @students = User.student
  end
end
