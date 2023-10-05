class BriefTemplate < ApplicationRecord
  belongs_to :company
  belongs_to :user
  belongs_to :client, optional: true
  belongs_to :global_brief_template, optional: true
  has_many :briefs
end
