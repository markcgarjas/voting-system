Rails.application.routes.draw do
  devise_for :users,
             controllers: { sessions: 'students/sessions',
                            registrations: 'students/registrations',
                            passwwords: 'students/passwords'
             }

  root "students/home#index"
end
