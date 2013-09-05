class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :handle
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
