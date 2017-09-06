class AddRefsToStudentBelt < ActiveRecord::Migration[5.0]
  def change
    add_reference :student_belts, :student, foreign_key: true
    add_reference :student_belts, :belt, foreign_key: true
  end
end
