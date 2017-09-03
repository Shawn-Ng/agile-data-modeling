class AddIsChildToBelts < ActiveRecord::Migration[5.0]
  def change
    add_column :belts, :is_child, :boolean
  end
end
