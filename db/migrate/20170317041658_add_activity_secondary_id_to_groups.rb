class AddActivitySecondaryIdToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :activity_secondary_id, :integer
  end
end
