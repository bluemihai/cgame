class AddBasicToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :basic, :boolean
  end
end
