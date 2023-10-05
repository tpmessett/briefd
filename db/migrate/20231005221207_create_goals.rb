class CreateGoals < ActiveRecord::Migration[6.0] # or your specific Rails version
  def change
    create_table :goals do |t|
      t.references :brief, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.text :measurements, array: true, default: []
      t.date :date

      t.timestamps
    end
  end
end
