class CreateMoodBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :mood_boards do |t|
      t.string :name
      t.text :description
      t.references :brief, foreign_key: true
      t.references :client, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
