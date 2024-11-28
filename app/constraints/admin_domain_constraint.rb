# frozen_string_literal: true

class AdminDomainConstraint
  def matches?(request)
    domains = Rails.application.config_for(:domain)[:admin]
    domains.include? request.domain.downcase
  end
end
