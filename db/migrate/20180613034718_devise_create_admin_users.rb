class DeviseCreateAdminUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_users do |t|
      t.string :user_name,              null: false, default: ""
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.integer :permission, null: false, default: 0
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :admin_users, :user_name, unique: true
    add_index :admin_users, :email, unique: true
  end
end
