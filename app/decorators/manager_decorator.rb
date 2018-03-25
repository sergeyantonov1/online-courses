class ManagerDecorator < ApplicationDecorator
  delegate :email, :first_name, :second_name

  def full_name
    "#{first_name} #{second_name}"
  end

  def status
    "check"
  end
end
