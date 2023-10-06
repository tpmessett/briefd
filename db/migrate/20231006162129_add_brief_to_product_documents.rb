class AddBriefToProductDocuments < ActiveRecord::Migration[7.0]
  def change
    add_reference :product_documents, :brief, foreign_key: true
  end
end
