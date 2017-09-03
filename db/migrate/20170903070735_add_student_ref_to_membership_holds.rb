class AddStudentRefToMembershipHolds < ActiveRecord::Migration[5.0]
  def change
    add_reference :membership_holds, :student, foreign_key: true
  end
end
