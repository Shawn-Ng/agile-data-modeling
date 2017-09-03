class CreateTransactionTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :transaction_types do |t|
      t.text :description

      t.timestamps
    end
  end
end
