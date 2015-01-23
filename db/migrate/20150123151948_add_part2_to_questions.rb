class AddPart2ToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :part2, :text
  end
end
