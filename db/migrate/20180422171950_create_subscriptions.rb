class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.integer :course_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
