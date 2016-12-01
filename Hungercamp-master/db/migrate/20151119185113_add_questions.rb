class AddQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :assignment_id
      t.string :question
      t.boolean :answer
      t.integer :difficulty
    end
  end
end
