class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.text :text

      t.timestamps
    end
  end
end
