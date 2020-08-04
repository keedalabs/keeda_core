class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.float :latitude
      t.float :longitude
      t.datetime :starttime
      t.datetime :endtime
      t.text :address

      t.timestamps
    end
  end
end
