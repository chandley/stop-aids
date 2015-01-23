class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.integer :party_id
      t.string :name

      t.timestamps
    end
  end
end
