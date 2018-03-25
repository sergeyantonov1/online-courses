class AddSuperManagerToManager < ActiveRecord::Migration[5.1]
  def change
    add_column :managers, :super_manager, :boolean, null: false, default: false
  end
end
