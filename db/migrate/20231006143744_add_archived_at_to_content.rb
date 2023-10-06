class AddArchivedAtToContent < ActiveRecord::Migration[7.0]
  def change
    add_column :contents, :archived_at, :datetime
  end
end
