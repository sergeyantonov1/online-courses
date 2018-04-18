class AddCourseFileToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :course_file, :string
  end
end
