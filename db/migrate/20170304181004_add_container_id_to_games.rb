class AddContainerIdToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :container_id, :integer
    add_column :games, :container_weeks, :integer
  end
end
