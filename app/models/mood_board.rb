class MoodBoard < ApplicationRecord
  belongs_to :brief, optional: true
  belongs_to :client, optional: true
  belongs_to :company
  belongs_to :user
  has_many :contents
end
