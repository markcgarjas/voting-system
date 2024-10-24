Rails.application.routes.draw do
  devise_for :users,
             controllers: { sessions: 'users/sessions',
                            registrations: 'users/registrations',
                            passwwords: 'users/passwords'
             }

  root "users/home#index"
end
