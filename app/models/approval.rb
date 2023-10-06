class Approval < ApplicationRecord
  belongs_to :brief
  belongs_to :user
end
