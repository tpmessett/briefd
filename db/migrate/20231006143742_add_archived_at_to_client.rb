class AddArchivedAtToClient < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :archived_at, :datetime
  end
end
