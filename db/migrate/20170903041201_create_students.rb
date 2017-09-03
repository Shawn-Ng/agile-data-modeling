class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.datetime :enroll_date
      t.datetime :drop_date

      t.timestamps
    end
  end
end
