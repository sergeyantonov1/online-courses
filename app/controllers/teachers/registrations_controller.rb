module Teachers
  class RegistrationsController < Devise::RegistrationsController
    before_action :require_no_authentication, only: :new

    private

    def require_no_authentication
      redirect_to cabinet_root_path if teacher_signed_in?

      sign_out(current_user) if user_signed_in?
      sign_out(current_manager) if manager_signed_in?
    end
  end
end
