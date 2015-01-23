class RemovePart1FromQuestion < ActiveRecord::Migration
  def change
    remove_column :questions, :part1, :text
  end
end
