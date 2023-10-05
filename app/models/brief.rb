class Brief < ApplicationRecord
  belongs_to :brief_template
  belongs_to :user
  belongs_to :client
  has_many :mood_boards
end
