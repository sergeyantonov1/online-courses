class Lesson < ApplicationRecord
    belongs_to :course
    belongs_to :teacher

    has_many :users
end
