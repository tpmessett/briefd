class CreatePositioningMaps < ActiveRecord::Migration[7.0]
  def change
    create_table :positioning_maps do |t|
      t.string :name
      t.text :description
      t.string :type
      t.references :client, foreign_key: true
      t.references :brief, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
