class AddAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.date :due_date
      t.integer :ruby_points
      t.integer :html_points
      t.integer :database_points
      t.integer :die_hours 
      t.timestamps
    end
  end
end
