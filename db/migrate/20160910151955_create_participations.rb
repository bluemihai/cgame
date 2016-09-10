class CreateParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :participations do |t|
      t.integer :group_id
      t.integer :user_id
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
