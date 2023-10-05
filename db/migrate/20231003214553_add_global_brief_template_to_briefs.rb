class AddGlobalBriefTemplateToBriefs < ActiveRecord::Migration[7.0]
  def change
    add_reference :brief_templates, :global_brief_template, foreign_key: true
  end
end
