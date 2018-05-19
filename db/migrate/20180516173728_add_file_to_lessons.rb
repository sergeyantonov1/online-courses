class AddFileToLessons < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :lessons_file, :string
  end
end
