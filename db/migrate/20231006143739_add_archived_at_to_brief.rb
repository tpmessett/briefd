class AddArchivedAtToBrief < ActiveRecord::Migration[7.0]
  def change
    add_column :briefs, :archived_at, :datetime
  end
end
