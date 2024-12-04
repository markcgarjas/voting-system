# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :breadcrumb_title, :breadcrumb_path

  private

  def set_breadcrumb(title = nil, path = nil)
    @breadcrumb_title = title
    @breadcrumb_path = path
  end

  attr_reader :breadcrumb_title, :breadcrumb_path
end
