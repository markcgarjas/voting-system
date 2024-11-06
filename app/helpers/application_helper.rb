module ApplicationHelper
  def sorted_organization_members(members)
    members.sort_by { |member| member.officer_position.sort }
  end

  def sorted_students(students)
    students.sort_by { |user| user.username }
  end

  def sorted_positions(positions)
    positions.sort_by { |position| position.name }
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
end
