class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.integer :constituency_id
      t.text :name
      t.integer :party_id

      t.timestamps
    end
  end
end
