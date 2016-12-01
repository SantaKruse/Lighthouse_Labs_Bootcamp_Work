class AddUsers < ActiveRecord::Migration
  def change
      create_table :users do |t|
        t.string :first_name
        t.string :last_name
        t.string :photo_url
        t.date :start_date
        t.datetime :time_of_death
        t.timestamps
      end
  end
end
