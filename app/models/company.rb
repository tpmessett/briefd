class Company < ApplicationRecord
  has_many :clients
  has_many :company_assignments
  has_many :users, through: :company_assignments
  has_many :mood_boards
end
