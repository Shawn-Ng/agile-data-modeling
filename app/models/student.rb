class Student < ApplicationRecord
  belongs_to  :user
  belongs_to  :belt
  has_many    :membership_holds
  has_many    :belt_attempts
end
