class AddParentIdToActivity < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :parent_id, :integer
    add_column :activities, :sort_order, :integer
  end
end
