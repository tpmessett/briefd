class Invite < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :brief, optional: true
  belongs_to :user, optional: true
  belongs_to :company, optional: true
end
