class CreateBeltAttempts < ActiveRecord::Migration[5.0]
  def change
    create_table :belt_attempts do |t|
      t.boolean :pass

      t.timestamps
    end
  end
end
