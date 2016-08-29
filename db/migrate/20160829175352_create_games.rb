class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.datetime :starting
      t.datetime :ending
      t.integer :location_id
      t.integer :host_id
      t.string :facebook_event_url
      t.text :review

      t.timestamps
    end
  end
end
