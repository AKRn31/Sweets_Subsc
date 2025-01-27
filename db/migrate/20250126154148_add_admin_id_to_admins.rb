class AddAdminIdToAdmins < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :admin_id, :string, null: false, default: ""
    add_column :admins, :password, :string, null: false, default: ""
  end
end
