class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string    :name
      t.text      :details
      t.integer   :user_id
      t.string    :latitude
      t.string    :longitude
      t.string    :location_name
      t.datetime  :scheduled_at
      t.timestamps
    end
  end
end
