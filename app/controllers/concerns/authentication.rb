module Authentication
  extend ActiveSupport::Concern

  included do
    helper do
      def current_user
        super.decorate if user_signed_in?
      end

      def current_manager
        super.decorate if manager_signed_in?
      end
    end
  end

  private

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    elsif resource_class == Manager
      Manager::ParameterSanitizer.new(Manager, :manager, params)
    else
      super
    end
  end
end
