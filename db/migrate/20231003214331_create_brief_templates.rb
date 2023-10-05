class CreateBriefTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :brief_templates do |t|
      t.string :name
      t.string :type
      t.text :fields, array: true, default: []
      t.references :company, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :client, foreign_key: true
      t.boolean :internal, default: false

      t.timestamps
    end

    add_index :brief_templates, :fields, using: 'gin'
  end
end
