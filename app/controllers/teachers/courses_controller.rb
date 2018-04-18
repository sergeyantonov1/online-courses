module Teachers
  class CoursesController < BaseController
    expose :course
    expose :courses, -> { Course.where(teacher: current_teacher) }

    def create
      course.teacher = current_teacher
      course.save

      respond_with :teachers, course
    end

    private

    def course_params
      params.require(:course).permit(:title, :description, :course_file)
    end
  end
end
