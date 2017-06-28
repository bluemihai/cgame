class CreateCharges < ActiveRecord::Migration[5.0]
  def change
    create_table :charges do |t|
      t.integer :amount
      t.integer :container_id
      t.integer :user_id
      t.text :comment

      t.timestamps
    end
  end
end
