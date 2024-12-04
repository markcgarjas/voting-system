# frozen_string_literal: true

module BreadcrumbHelper
  def render_breadcrumbs
    content_tag(:nav, class: 'flex') do
      content_tag(:ol, class: 'flex items-center space-x-2 mb-6') do
        build_breadcrumb_items
      end
    end
  end

  private

  def build_breadcrumb_items
    safe_join([
      home_breadcrumb,
      controller_breadcrumb,
      action_breadcrumb
    ].compact, separator)
  end

  def home_breadcrumb
    content_tag(:li) do
      link_to('Home', admin_root_path, class: 'text-gray-400 hover:text-gray-500')
    end
  end

  def controller_breadcrumb
    return nil if controller_name == 'home'

    content_tag(:li) do
      link_to(
        custom_breadcrumb_title || controller_name.titleize,
        custom_breadcrumb_path || url_for(controller: controller_name, action: :index),
        class: 'text-gray-400 hover:text-gray-500'
      )
    end
  end

  def action_breadcrumb
    return nil if action_name == 'index'

    content_tag(:li) do
      content_tag(:span, custom_breadcrumb_title || action_name.titleize, class: 'text-gray-400 hover:text-gray-500')
    end
  end

  def separator
    content_tag(:li) do
      content_tag(:span, '/', class: 'text-gray-400 hover:text-gray-500')
    end
  end
end
