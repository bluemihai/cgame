class CreateOfferings < ActiveRecord::Migration[5.0]
  def change
    create_table :offerings do |t|
      t.string :name
      t.text :description
      t.string :presenter
      t.integer :price_min
      t.integer :price_ideal
      t.integer :hours_min
      t.integer :hours_ideal
      t.text :other_logistics
      t.text :presenter_bio
      t.integer :creator_id

      t.timestamps
    end
  end
end
