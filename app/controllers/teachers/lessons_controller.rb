module Teachers
  class LessonsController < ApplicationController
    before_action :set_lesson, only: %[edit update destroy]
   
    def new
      @lesson = Lesson.new
    end

    def create
      @lesson = Lesson.new(lesson_params) do |lesson|
        lesson.course_id = params[:course_id]
        lesson.teacher_id = Course.find(params[:course_id]).teacher.id
      end
        if @lesson.save
          redirect_to teachers_course_path(@lesson.course) 
      else
        render :new
      end
    end

    def index
      @lessons = Lesson.all
    end

    def show
      @lesson = Lesson.find(params[:id])
    end

    def edit
      @lesson = Lesson.find(params[:id])
    end

    def update
      @lesson = Lesson.find(params[:id])
      @lesson.update(lesson_params)
      redirect_to teachers_course_path(@lesson.course) 
    end

    def destroy
      @lesson = Lesson.find(params[:id])
      course = @lesson.course
      @lesson.destroy
      redirect_to teachers_course_path(course)
    end

    protected

    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    def lesson_params
      params.require(:lesson).permit(:name, :description)
    end
  end
end
