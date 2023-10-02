class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.jsonb :compulsory_fields
      t.text :notes

      t.timestamps
    end
  end
end
