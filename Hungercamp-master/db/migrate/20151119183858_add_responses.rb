class AddResponses < ActiveRecord::Migration
  def change
      create_table :responses do |t|
        t.integer :user_id
        t.integer :assignment_id
        t.integer :rating
        t.timestamps
      end
  end
end
