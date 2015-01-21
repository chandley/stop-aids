class AddTwitterToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :twitter, :string
  end
end
