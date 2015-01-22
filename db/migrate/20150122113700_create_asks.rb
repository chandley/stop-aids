class CreateAsks < ActiveRecord::Migration
  def change
    create_table :asks do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :question_id
      t.integer :candidate_id

      t.timestamps
    end
  end
end
