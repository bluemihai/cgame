class AddCohostIdToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :cohost_id, :integer
  end
end
