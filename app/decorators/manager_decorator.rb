class ManagerDecorator < ApplicationDecorator
  delegate :email, :first_name, :second_name, :super_manager

  def full_name
    "#{first_name} #{second_name}"
  end

  def status
    "check"
  end
end
