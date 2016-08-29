class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.integer :wild_card_weight
      t.string :image_url

      t.timestamps
    end
  end
end
