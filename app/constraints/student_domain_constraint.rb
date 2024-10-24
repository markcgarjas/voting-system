class StudentDomainConstraint
  def matches?(request)
    domains = Rails.application.config_for(:domain)[:student]
    domains.include? request.domain.downcase
  end
end