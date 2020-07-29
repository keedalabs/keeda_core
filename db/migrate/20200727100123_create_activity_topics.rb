class CreateActivityTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_topics do |t|
      t.references :activity, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
