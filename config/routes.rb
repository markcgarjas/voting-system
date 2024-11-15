Rails.application.routes.draw do
  constraints(AdminDomainConstraint.new) do
    scope module: 'admin' do
      devise_for :users,
                 controllers: { sessions: 'admin/sessions' },
                 skip: %i[registrations passwords confirmations unlocks], as: :admin
      resources :organizations do
        resources :members
      end
      resources :officer_positions
      resources :students
      resources :admins
      resources :elections
      resources :party_lists

      root to: "home#index", as: :admin_root
    end
  end

  constraints(StudentDomainConstraint.new) do
    devise_for :users,
               controllers: {
                 sessions: 'students/sessions',
                 registrations: 'students/registrations',
                 passwords: 'students/passwords'
               }

    root to: "students/home#index", as: :student_root
  end
end
