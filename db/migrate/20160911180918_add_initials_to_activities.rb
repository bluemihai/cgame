class AddInitialsToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :initials, :string
  end
end
