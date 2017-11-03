class AddBlurbToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :blurb, :text
  end
end
