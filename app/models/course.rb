class Course < ApplicationRecord
  mount_uploader :course_file, CourseFileUploader

  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions

  belongs_to :teacher

  validates :title, :description, :teacher, presence: true
end
