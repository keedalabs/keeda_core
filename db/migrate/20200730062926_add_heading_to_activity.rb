class AddHeadingToActivity < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :heading, :text
  end
end
