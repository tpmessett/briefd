class CreateBrandDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :brand_documents do |t|
      t.string :name
      t.text :summary
      t.text :link
      t.references :client, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
