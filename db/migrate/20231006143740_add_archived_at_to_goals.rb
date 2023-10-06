class AddArchivedAtToGoals < ActiveRecord::Migration[7.0]
  def change
    add_column :goals, :archived_at, :datetime
  end
end
