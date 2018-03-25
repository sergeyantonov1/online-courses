Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  devise_for :managers,
    controllers: {
      sessions: "managers/sessions",
      invitations: "managers/invitations"
    }, skip: %i[registrations]

  as :manager do
    get "managers/edit", to: "managers/registrations#edit", as: "edit_manager_registration"
    put "managers", to: "managers/registrations#update"
    delete "managers", to: "managers/registrations#destroy"
  end

  namespace :cabinet do
    resources :managers, only: %i[index]

    root to: "managers#index"
  end
  root to: "pages#home"
end
