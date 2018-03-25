class Manager
  class ParameterSanitizer < Devise::ParameterSanitizer
    MANAGER_PARAMS = %i[
      first_name
      second_name
      email
      password
      password_confirmation
    ].freeze

    def initialize(*)
      super
      permit(:sign_up, keys: MANAGER_PARAMS)
      permit(:account_update, keys: MANAGER_PARAMS)
      permit(:invite, keys: MANAGER_PARAMS)
    end
  end
end
