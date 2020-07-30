class ChangeColumnTypeForReactions < ActiveRecord::Migration[6.0]
  def change
    rename_column :reactions, :type, :verb
  end
end
