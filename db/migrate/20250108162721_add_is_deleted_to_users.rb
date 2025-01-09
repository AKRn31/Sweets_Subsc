class AddIsDeletedToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :is_deleted, :boolean
  end
end
