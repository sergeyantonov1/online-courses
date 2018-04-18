Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  devise_for :managers,
    controllers: {
      sessions: "managers/sessions",
      invitations: "managers/invitations"
    }, skip: %i[registrations]

  devise_for :teachers,
    controllers: {
      invitations: "teachers/invitations",
      sessions: "teachers/sessions"
    }, skip: %i[registrations]

  as :manager do
    get "managers/edit", to: "managers/registrations#edit", as: "edit_manager_registration"
    put "managers", to: "managers/registrations#update"
    delete "managers", to: "managers/registrations#destroy"
  end

  as :teacher do
    get "teachers/edit", to: "teachers/registrations#edit", as: "edit_teacher_registration"
    put "teachers", to: "teachers/registrations#update"
    delete "teachers", to: "teachers/registrations#destroy"
  end

  namespace :teachers do
    resources :courses
  end

  namespace :cabinet do
    resources :managers, only: %i[index]

    root to: "managers#index"
  end
  root to: "pages#home"
end
