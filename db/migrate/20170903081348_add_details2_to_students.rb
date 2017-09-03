class AddDetails2ToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :is_child, :boolean
    add_reference :students, :family, foreign_key: true
  end
end
