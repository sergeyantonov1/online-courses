class SubscriptionDecorator < ApplicationDecorator
  delegate :status

  def course
    object.course.decorate
  end

  def user
    object.user.decorate
  end
end
