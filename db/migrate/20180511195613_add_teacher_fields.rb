class AddTeacherFields < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :photo, :string
    add_column :teachers, :birth_date, :date
  end
end
