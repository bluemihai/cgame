class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.integer :round_id
      t.integer :activity_id
      t.integer :wc_id
      t.string :wc_interpretation
      t.string :wc_curation

      t.timestamps
    end
  end
end
