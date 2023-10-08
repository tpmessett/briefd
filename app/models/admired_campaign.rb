class AdmiredCampaign < ApplicationRecord
  belongs_to :brief, optional: true
  belongs_to :client, optional: true
end
