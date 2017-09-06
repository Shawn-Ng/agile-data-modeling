class Transaction < ApplicationRecord
  belongs_to  :user
  belongs_to  :transaction_type
  has_many  :orders
end
