class Lesson < ApplicationRecord
  mount_uploader :lesson_file, LessonFileUploader

  belongs_to :course
  belongs_to :teacher

  has_many :users
end
