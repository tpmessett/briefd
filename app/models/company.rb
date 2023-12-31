class Company < ApplicationRecord
  has_many :clients
  has_many :company_assignments
  has_many :users, through: :company_assignments
  has_many :mood_boards
  has_many :product_documents
  has_many :brand_documents
  has_many :brief_templates
  has_many :positioning_maps
  has_many :invites
  validates :name, presence: true
end
