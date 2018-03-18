Rails.application.routes.draw do
  devise_for :managers, controllers: { registrations: "managers/registrations" }
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
end
