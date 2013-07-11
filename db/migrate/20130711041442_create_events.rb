class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string    :name
      t.text      :details
      t.integer   :user_id
      t.string    :latitude
      t.string    :longitude
      t.string    :location_name
      t.datetime  :schedule_time
      t.timestamps
    end
  end
end
