class RemoveResponseFromAnswer < ActiveRecord::Migration
  def change
    remove_column :answers, :response, :text
  end
end
