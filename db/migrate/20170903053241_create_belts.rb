class CreateBelts < ActiveRecord::Migration[5.0]
  def change
    create_table :belts do |t|
      t.text :description

      t.timestamps
    end
  end
end
