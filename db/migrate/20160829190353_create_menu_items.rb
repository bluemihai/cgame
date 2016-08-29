class CreateMenuItems < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_items do |t|
      t.integer :activity_id
      t.integer :game_id
      t.integer :times_chosen

      t.timestamps
    end
  end
end
