class Teacher
  class ParameterSanitizer < Devise::ParameterSanitizer
    TEACHER_PARAMS = %i[
      first_name
      second_name
      email
      password
      password_confirmation
    ].freeze

    def initialize(*)
      super
      permit(:sign_up, keys: TEACHER_PARAMS)
      permit(:account_update, keys: TEACHER_PARAMS)
      permit(:invite, keys: TEACHER_PARAMS)
    end
  end
end
