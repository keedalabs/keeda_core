class CreateReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :reactions do |t|
      t.string :type
      t.references :user, null: false, foreign_key: true
      t.json :object
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
