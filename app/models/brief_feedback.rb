class BriefFeedback < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :client, optional: true
  belongs_to :brief_template, optional: true
end
