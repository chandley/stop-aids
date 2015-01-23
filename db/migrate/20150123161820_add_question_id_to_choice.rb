class AddQuestionIdToChoice < ActiveRecord::Migration
  def change
    add_column :choices, :question_id, :integer
  end
end
