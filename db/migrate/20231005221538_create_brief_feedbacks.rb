class CreateBriefFeedbacks < ActiveRecord::Migration[7.0] # or your specific Rails version
  def change
    create_table :brief_feedbacks do |t|
      t.references :company, foreign_key: true
      t.references :client, foreign_key: true
      t.text :keywords, array: true, default: []
      t.text :red_flags, array: true, default: []
      t.text :notes

      t.timestamps
    end
  end
end
