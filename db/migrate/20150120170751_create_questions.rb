class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :ask_text

      t.timestamps
    end
  end
end
