class AddTransactionTypeRefToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_reference :transactions, :transaction_type, foreign_key: true
  end
end
