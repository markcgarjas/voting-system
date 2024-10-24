Rails.application.routes.draw do
  constraints(AdminDomainConstraint.new) do
    scope module: 'admin', as: :admin do
      devise_for :users,
                 controllers: { sessions: 'admin/sessions' },
                 skip: %i[registrations passwords confirmations unlocks]

      root to: "home#index"
    end
  end

  constraints(StudentDomainConstraint.new) do
    devise_for :users,
               controllers: {
                 sessions: 'students/sessions',
                 registrations: 'students/registrations',
                 passwords: 'students/passwords'
               }

    root to: "students/home#index"
  end
end
