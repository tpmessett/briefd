class BrandDocument < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :brief, optional: true
  belongs_to :user
end
