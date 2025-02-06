class AddDeletedAtToAdmins < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :deleted_at, :datetime
    add_index :admins, :deleted_at
  end
end
