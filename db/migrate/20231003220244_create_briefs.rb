class CreateBriefs < ActiveRecord::Migration[7.0]
  def change
    create_table :briefs do |t|
      t.text :responses, array: true, default: []
      t.references :brief_template, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :client, foreign_key: true

      t.timestamps
    end

  add_index :briefs, :responses, using: 'gin'

  end
end
