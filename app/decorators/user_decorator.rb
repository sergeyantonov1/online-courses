class UserDecorator < ApplicationDecorator
  delegate :id, :first_name, :second_name, :email

  def full_name_with_email
    "#{object.first_name} (#{object.email})"
  end
end
