class Belt < ApplicationRecord
  has_many  :students
  has_many  :belt_attempts
end
