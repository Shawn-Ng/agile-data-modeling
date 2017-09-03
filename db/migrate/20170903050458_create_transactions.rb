class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.decimal :amount, precision: 15, scale: 5
      t.datetime :payment_date

      t.timestamps
    end
  end
end
