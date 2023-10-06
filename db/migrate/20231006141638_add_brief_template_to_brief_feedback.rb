class AddBriefTemplateToBriefFeedback < ActiveRecord::Migration[7.0]
  def change
    add_reference :brief_feedbacks, :brief_template, foreign_key: true
  end
end
