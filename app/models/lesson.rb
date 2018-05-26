class Lesson < ApplicationRecord
  belongs_to :course
  belongs_to :teacher

  has_many :users
  has_many :tasks
end
