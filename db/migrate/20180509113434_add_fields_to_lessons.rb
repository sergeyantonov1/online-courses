class AddFieldsToLessons < ActiveRecord::Migration[5.1]
  def change
    change_table :lessons do |t|
      t.integer :course_id, null: false
      t.integer :teacher_id, null: false
    end
  end
end
