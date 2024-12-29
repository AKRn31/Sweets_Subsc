class CreateSubscs < ActiveRecord::Migration[6.1]
  def change
    create_table :subscs do |t|
      t.string :name
      t.string :company_name
      t.string :title
      t.text :introduction
      t.integer :fee
      t.integer :postage
      t.string :delivery_frequenc
      t.string :minimum_period

      t.timestamps
    end
  end
end
