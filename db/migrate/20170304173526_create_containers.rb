class CreateContainers < ActiveRecord::Migration[5.0]
  def change
    create_table :containers do |t|
      t.string :name
      t.datetime :starting
      t.integer :weeks
      t.integer :location_id
      t.integer :host_id
      t.integer :cohost_id

      t.timestamps
    end
  end
end
