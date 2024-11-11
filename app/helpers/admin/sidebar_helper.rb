module Admin::SidebarHelper
  MENU_LISTS = {
    student: %w[
      students organizations officer_positions
    ],
    admin: %w[
      admins
    ]
  }

  def menu_switch(name, controller, menu_list = Admin::SidebarHelper::MENU_LISTS)
    menu_list[name].include?(controller) ? '' : 'hidden'
  end
end