class Client < ApplicationRecord
  belongs_to :company
  has_many :client_assignments
  has_many :users, through: :client_assignments
  has_many :briefs
  has_many :mood_boards
end
