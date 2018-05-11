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
    resources :courses do
      resources :lessons
    end
    resources :conversations do
      resources :messages
    end
  end

  namespace :cabinet do
    namespace :admin do
      resources :managers, only: %i[index]
      resources :subscriptions, only: %i[index] do
        member do
          patch :approve
          patch :cancel
        end
      end

      root to: "managers#index"
    end

    namespace :client do
      resources :subscriptions, only: %i[index create]

      get "dashboard", to: "pages#dashboard"
      get "profile", to: "pages#profile"

      root to: "pages#dashboard"
    end
  end

  resources :courses, only: %i[index]

  namespace :users do
    resources :conversations do
      resources :messages
    end
  end

  namespace :managers do
    resources :conversations do
      resources :messages
    end
  end

  root to: "courses#index"
end
