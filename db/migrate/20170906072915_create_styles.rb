class CreateStyles < ActiveRecord::Migration[5.0]
  def change
    create_table :styles do |t|
      t.text :description
      t.boolean :has_belts

      t.timestamps
    end
  end
end
