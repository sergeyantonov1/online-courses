module Teachers
  class TasksController < ApplicationController
    expose :lesson, -> { Lesson.find(params[:lesson_id]) }
    expose :course, -> { lesson.course }
    expose :tasks, -> { lesson.tasks }
    expose :task, -> { Task.find(params[:id]) }

    def new
      @task = Task.new
    end

    def create
      @task = Task.new(task_params) do |task|
        task.lesson_id = params[:lesson_id]
      end
      if @task.save
        redirect_to teachers_course_lesson_path(lesson.course, lesson)
      else
        render :new
      end
    end

    def update
      task.update(task_params)
      redirect_to teachers_course_lesson_tasks_path(lesson.course, lesson)
    end

    private

    def task_params
      params.require(:task).permit(:name, :question)
    end
  end
end
