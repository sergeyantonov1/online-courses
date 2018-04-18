class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :teacher_id, null: false

      t.timestamps
    end
  end
end
