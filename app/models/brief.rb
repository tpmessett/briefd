class Brief < ApplicationRecord
  belongs_to :brief_template
  belongs_to :user
  belongs_to :client
  has_many :mood_boards
  has_many :approvals
  validates :client_score, :company_score, :brief_score, :total_score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end
