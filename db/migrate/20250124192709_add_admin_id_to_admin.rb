class AddAdminIdToAdmin < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :admin_id, :string
  end
end
