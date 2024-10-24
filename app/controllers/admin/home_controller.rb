class Admin::HomeController < ApplicationController
  def index
    @students = User.student
  end
end
