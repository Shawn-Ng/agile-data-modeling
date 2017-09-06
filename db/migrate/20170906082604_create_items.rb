class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :item_number
      t.text :description
      t.decimal :price, precision: 15, scale: 5

      t.timestamps
    end
  end
end
