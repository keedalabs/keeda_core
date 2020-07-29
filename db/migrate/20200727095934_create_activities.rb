class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :verb
      t.json :object
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.integer :parent_activity_id

      t.timestamps
    end
  end
end
