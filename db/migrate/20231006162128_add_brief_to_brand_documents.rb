class AddBriefToBrandDocuments < ActiveRecord::Migration[7.0]
  def change
    add_reference :brand_documents, :brief, foreign_key: true
  end
end
