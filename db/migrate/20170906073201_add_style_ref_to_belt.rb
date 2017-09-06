class AddStyleRefToBelt < ActiveRecord::Migration[5.0]
  def change
    add_reference :belts, :style, foreign_key: true
    add_column :belts, :style_sequence, :integer
  end
end
