class ChangeUserIdToAdminUserId < ActiveRecord::Migration[5.1]
  def change
    rename_column :reviews, :user_id, :admin_user_id
  end
end
