class AddApprovalFlowToBriefTemplate < ActiveRecord::Migration[7.0]
  def change
    add_column :brief_templates, :approval_flow, :integer, array: true, default: []
  end
end
