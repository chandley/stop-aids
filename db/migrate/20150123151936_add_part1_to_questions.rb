class AddPart1ToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :part1, :text
  end
end
