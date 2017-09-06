class Belt < ApplicationRecord
  has_many  :belt_attempts
  has_many  :students, :through => :belt_attempts
  belongs_to  :style
end
