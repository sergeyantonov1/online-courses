class CourseDecorator < ApplicationDecorator
  delegate :id, :title, :description, :users

  def teacher_full_name
    object.teacher.decorate.full_name
  end
end
