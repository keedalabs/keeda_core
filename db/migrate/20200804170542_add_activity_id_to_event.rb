class AddActivityIdToEvent < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :activity, null: false, foreign_key: true
  end
end
