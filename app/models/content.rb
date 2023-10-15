class Content < ApplicationRecord
  belongs_to :mood_board
  has_one_attached :file_upload
end
