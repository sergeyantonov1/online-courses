class DeviseCreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.string :first_name, null: false, default: ""
      t.string :second_name, null: false, default: ""
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.datetime :remember_created_at

      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      t.timestamps null: false
    end

    add_index :teachers, :email,                unique: true
    add_index :teachers, :reset_password_token, unique: true
  end
end
