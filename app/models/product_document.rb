class ProductDocument < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :brief, optional: true
  belongs_to :user
  has_one_attached :file_upload
end
