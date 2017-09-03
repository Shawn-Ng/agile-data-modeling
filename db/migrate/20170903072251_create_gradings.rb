class CreateGradings < ActiveRecord::Migration[5.0]
  def change
    create_table :gradings do |t|
      t.datetime :date
      t.time :time
      t.decimal :cost, precision: 15, scale: 5

      t.timestamps
    end
  end
end
