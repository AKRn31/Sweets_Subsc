class RemoveEmailFromAdmins < ActiveRecord::Migration[6.1]
  def change
    remove_column :admins, :email, :string
  end
end
