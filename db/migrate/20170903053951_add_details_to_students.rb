class AddDetailsToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :grading_date, :datetime
    add_reference :students, :belt, foreign_key: true
  end
end
