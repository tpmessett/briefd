class AddArchivedAtToBriefTemplate < ActiveRecord::Migration[7.0]
  def change
    add_column :brief_templates, :archived_at, :datetime
  end
end
