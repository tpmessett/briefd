class Client < ApplicationRecord
  belongs_to :company
  has_many :client_assignments
  has_many :users, through: :client_assignments
  has_many :briefs
  has_many :mood_boards
  has_many :positioning_maps
  has_many :product_documents
  has_many :brand_documents
  has_many :personas
  has_many :admired_brands
  has_many :admired_campaigns
end
