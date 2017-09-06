class CreateStudentBelts < ActiveRecord::Migration[5.0]
  def change
    create_table :student_belts do |t|

      t.timestamps
    end
  end
end
