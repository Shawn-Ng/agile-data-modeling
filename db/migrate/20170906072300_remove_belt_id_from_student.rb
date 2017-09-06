class RemoveBeltIdFromStudent < ActiveRecord::Migration[5.0]
  def change
    remove_reference :students, :belt, foreign_key: true
  end
end
