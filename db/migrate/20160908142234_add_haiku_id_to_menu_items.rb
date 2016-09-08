class AddHaikuIdToMenuItems < ActiveRecord::Migration[5.0]
  def change
    add_column :menu_items, :haiku_id, :integer
  end
end
