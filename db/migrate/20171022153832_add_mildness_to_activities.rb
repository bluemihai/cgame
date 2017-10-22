class AddMildnessToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :mildness, :integer
  end
end
