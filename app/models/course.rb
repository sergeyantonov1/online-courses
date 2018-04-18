class Course < ApplicationRecord
  mount_uploaders :course_file, CourseFileUploader
  belongs_to :teacher

  validates :title, :description, :teacher, presence: true
end
