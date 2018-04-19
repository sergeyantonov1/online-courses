class Course < ApplicationRecord
  mount_uploader :course_file, CourseFileUploader
  belongs_to :teacher

  validates :title, :description, :teacher, presence: true
end
