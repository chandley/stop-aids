class CreateConstituencies < ActiveRecord::Migration
  def change
    create_table :constituencies do |t|
      t.text :name
      t.integer :pa_id

      t.timestamps
    end
  end
end
