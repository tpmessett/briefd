class AddArchivedAtToGlobalBriefTemplate < ActiveRecord::Migration[7.0]
  def change
    add_column :global_brief_templates, :archived_at, :datetime
  end
end
