class Student < ApplicationRecord
  belongs_to  :user
  belongs_to  :family
  has_many  :membership_holds
  has_many  :belt_attempts
  has_many  :student_belts
  has_many  :belts, :through => :student_belts
end
