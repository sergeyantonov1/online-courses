require "rails_helper"

describe User do
  it { is_expected.to validate_presence_of :first_name }
end
