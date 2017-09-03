class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :town
      t.string :phone

      t.timestamps
    end
  end
end
