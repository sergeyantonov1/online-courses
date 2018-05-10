class UserDecorator < ApplicationDecorator
  delegate :id, :first_name, :second_name, :email, :phone_number

  def full_name_with_email
    "#{object.first_name} (#{object.email})"
  end

  def full_name
    "#{object.first_name} #{object.second_name}"
  end

  def undecorate
    Draper.undecorate(object)
  end

  def subscription_approved?(id)
    object.subscriptions.find_by(course_id: id)&.status == "approved"
  end

  def subscription_canceled?(id)
    object.subscriptions.find_by(course_id: id)&.status == "canceled"
  end

  def subscription_new?(id)
    object.subscriptions.find_by(course_id: id)&.status == "new"
  end

  def full_name_with_middle_name
    "#{object.first_name} #{object.second_name} #{object.middle_name}"
  end
end
