class Client < ApplicationRecord
  belongs_to :company
  has_many :users
  has_many :briefs
  has_many :mood_boards
end
