class CreateRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.integer :game_id
      t.integer :order
      t.string :method_split

      t.timestamps
    end
  end
end
