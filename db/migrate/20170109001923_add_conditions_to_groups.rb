class AddConditionsToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :conditions, :string
  end
end
