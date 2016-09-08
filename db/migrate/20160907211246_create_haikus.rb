class CreateHaikus < ActiveRecord::Migration[5.0]
  def change
    create_table :haikus do |t|
      t.integer :author_id
      t.integer :activity_id
      t.string :activity_name
      t.text :content

      t.timestamps
    end

    change_column_default :activities, :haiku, from: 't', to: nil
  end
end
