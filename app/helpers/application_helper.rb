# frozen_string_literal: true

module ApplicationHelper
  include BreadcrumbHelper

  def custom_breadcrumb_title
    @custom_breadcrumb_title
  end

  def set_breadcrumb_title(title)
    @custom_breadcrumb_title = title
  end

  def custom_breadcrumb_path
    @custom_breadcrumb_path
  end

  def set_breadcrumb_path(path)
    @custom_breadcrumb_path = path
  end

  def sorted_organization_members(members)
    members.sort_by { |member| member.officer_position.sort }
  end

  def sorted_students(students)
    students.sort_by(&:username)
  end

  def sorted_positions(positions)
    positions.sort_by(&:name)
  end

  def content_title
    if current_page?(admin_root_path)
      'Admin Dashboard'
    else
      "#{action_name == 'index' ? '' : action_name.titleize} #{controller_name.titleize}"
    end
  end

  def is_active(controller)
    if controller_name == controller
      'bg-blue-500 text-white'
    else
      'hover:bg-gray-700'
    end
  end

  def search_param
    params[:search].to_s.strip
  end

  def total_count(model_name)
    model_name = model_name == 'students' ? 'users' : model_name
    model_name.to_s.classify.constantize.count
  end
end
