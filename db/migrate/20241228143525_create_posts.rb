class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer  :subsc_id
      t.string :title
      t.text :body
      t.text :comment
      t.integer :user_id

      t.timestamps
    end
  end
end
