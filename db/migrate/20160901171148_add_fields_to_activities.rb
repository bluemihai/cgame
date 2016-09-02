class AddFieldsToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :main, :boolean, default: false
    add_column :activities, :active, :boolean, default: true
    # add_column :activities, :haiku, :text, default: true
  end
end
