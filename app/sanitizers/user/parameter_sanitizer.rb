class User
  class ParameterSanitizer < Devise::ParameterSanitizer
    USER_PARAMS = %i[
      first_name
      second_name
      middle_name
      birthday
      phone_number
      email
      password
      password_confirmation
    ].freeze

    def initialize(*)
      super
      permit(:sign_up, keys: USER_PARAMS)
      permit(:account_update, keys: USER_PARAMS)
    end
  end
end
