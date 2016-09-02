class CreateRsvps < ActiveRecord::Migration[5.0]
  def change
    create_table :rsvps do |t|
      t.integer :user_id
      t.integer :game_id
      t.boolean :attended
      t.integer :rsvp_method

      t.timestamps
    end
  end
end
