class AddArchivedAtToMoodboard < ActiveRecord::Migration[7.0]
  def change
    add_column :mood_boards, :archived_at, :datetime
  end
end
