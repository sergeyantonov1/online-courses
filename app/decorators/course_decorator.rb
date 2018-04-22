class CourseDecorator < ApplicationDecorator
  delegate :id, :title, :description, :users

  def teacher_full_name
    object.teacher.decorate.full_name
  end

  def subscription_link
    if users.include?(current_user)
      link_to("Перейти к курсу")
    else
      link_to("Подписаться на курс")
    end
  end
end
