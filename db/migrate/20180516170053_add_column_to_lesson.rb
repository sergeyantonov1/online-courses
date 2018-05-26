class AddColumnToLesson < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :begin_date, :datetime
    add_column :lessons, :end_date, :datetime
  end
end
