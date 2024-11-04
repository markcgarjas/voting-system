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
end
