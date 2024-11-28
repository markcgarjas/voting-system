# frozen_string_literal: true

module Admin
  module Rescueable
    extend ActiveSupport::Concern

    included do
      rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_referrer_or_path
    end

    private

    def redirect_to_referrer_or_path
      redirect_path = request.referrer || admin_root_path
      redirect_to redirect_path, alert: '404 Page Not Found'
    end
  end
end
