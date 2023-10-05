class AddGoalFrameworkToBrief < ActiveRecord::Migration[7.0]
  def change
    add_column :briefs, :goal_framework, :string
  end
end
