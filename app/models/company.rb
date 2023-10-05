class Company < ApplicationRecord
  has_many :clients
  has_many :users
  has_many :mood_boards
end
