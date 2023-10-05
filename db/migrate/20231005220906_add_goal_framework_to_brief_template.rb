class AddGoalFrameworkToBriefTemplate < ActiveRecord::Migration[7.0]
  def change
    add_column :brief_templates, :goal_framework, :string
  end
end
