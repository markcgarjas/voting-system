class AdminController < ActionController::Base
  include ApplicationHelper

  before_action :authenticate_admin_user!
  layout 'admin'
end
