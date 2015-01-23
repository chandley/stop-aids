class RemovePart2FromQuestion < ActiveRecord::Migration
  def change
    remove_column :questions, :part2, :text
  end
end
