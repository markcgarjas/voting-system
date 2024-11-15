class AdminController < ActionController::Base
  include ApplicationHelper
  include Admin::Rescueable

  before_action :authenticate_admin_user!
  layout 'admin'
end
