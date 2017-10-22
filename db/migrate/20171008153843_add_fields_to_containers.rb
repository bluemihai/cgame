class AddFieldsToContainers < ActiveRecord::Migration[5.0]
  def change
    add_column :containers, :status, :integer
    add_column :containers, :weekday, :integer
    add_column :containers, :agreements, :text
  end
end
