class Lesson < ApplicationRecord
  mount_uploader :lessons_file, LessonFileUploader

  belongs_to :course
  belongs_to :teacher

  has_many :users
  has_many :tasks
end
