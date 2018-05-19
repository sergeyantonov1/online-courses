module Teachers
  class TasksController < ApplicationController
    expose :lesson, -> { Lesson.find(params[:lesson_id]) }
    expose :course, -> { lesson.course }
    expose :tasks, -> { lesson.tasks }
    expose :task

    def create
      task.lesson = lesson
      task.save

      redirect_to teachers_course_lesson_path(lesson.course, lesson)
    end

    def update
      task.update(task_params)
      redirect_to teachers_course_lesson_tasks_path(lesson.course, lesson)
    end

    def destroy
      task.destroy
      redirect_to teachers_course_lesson_tasks_path(lesson.course, lesson)
    end

    private

    def task_params
      params.require(:task).permit(:name, :question)
    end
  end
end
