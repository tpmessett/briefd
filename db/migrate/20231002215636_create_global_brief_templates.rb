class CreateGlobalBriefTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :global_brief_templates do |t|
      t.string :name
      t.string :template_type
      t.text :fields, array: true, default: []

      t.timestamps
    end

    add_index :global_brief_templates, :fields, using: 'gin'
  end
end
