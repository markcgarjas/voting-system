# frozen_string_literal: true

module Admin
  module SidebarHelper
    MENU_LISTS = {
      student: %w[
        students organizations officer_positions elections party_lists
      ],
      admin: %w[
        admins
      ]
    }.freeze

    def menu_switch(name, controller, menu_list = Admin::SidebarHelper::MENU_LISTS)
      menu_list[name].include?(controller) ? '' : 'hidden'
    end
  end
end
