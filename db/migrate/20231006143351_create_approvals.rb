class CreateApprovals < ActiveRecord::Migration[7.0]
  def change
    create_table :approvals do |t|
      t.references :brief, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :feedback
      t.datetime :approved_on
      t.datetime :rejected_on

      t.timestamps
    end
  end
end
