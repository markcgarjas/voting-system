# frozen_string_literal: true

module Admin
  class HomeController < AdminController
    def index
      @students = User.student
    end
  end
end
