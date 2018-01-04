class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :url
      t.string :abstract
      t.text :transcript
      t.integer :minutes

      t.timestamps
    end
  end
end
