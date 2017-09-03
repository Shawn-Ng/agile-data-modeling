class BeltAttempt < ApplicationRecord
  belongs_to  :student
  belongs_to  :belt
  belongs_to  :grading
end
