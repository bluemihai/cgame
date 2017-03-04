class CreateContainerCommitments < ActiveRecord::Migration[5.0]
  def change
    create_table :container_commitments do |t|
      t.integer :container_id
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
