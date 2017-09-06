class User < ApplicationRecord
  has_many  :students
  has_many  :transactions
  has_many  :orders
end
