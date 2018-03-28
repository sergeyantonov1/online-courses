class AddMoreInfoToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone_number, :string, unique: true
    add_column :users, :second_name, :string
    add_column :users, :first_name, :string
    add_column :users, :middle_name, :string
  end
end
