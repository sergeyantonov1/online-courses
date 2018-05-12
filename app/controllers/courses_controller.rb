class CoursesController < ApplicationController
  expose :courses, -> { fetch_courses }

  def index
  end

  private

  def fetch_courses
    Course.includes(:teacher, :users).all
  end
end
