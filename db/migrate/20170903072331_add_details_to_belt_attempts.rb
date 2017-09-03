class AddDetailsToBeltAttempts < ActiveRecord::Migration[5.0]
  def change
    add_reference :belt_attempts, :student, foreign_key: true
    add_reference :belt_attempts, :belt, foreign_key: true
    add_reference :belt_attempts, :grading, foreign_key: true
  end
end
