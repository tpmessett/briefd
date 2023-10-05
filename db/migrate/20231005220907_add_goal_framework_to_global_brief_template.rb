class AddGoalFrameworkToGlobalBriefTemplate < ActiveRecord::Migration[7.0]
  def change
    add_column :global_brief_templates, :goal_framework, :string
  end
end
