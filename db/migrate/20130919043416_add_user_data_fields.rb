class AddUserDataFields < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.datetime :birth_date
    end
  end
end
