class CreateAdmiredCampaigns < ActiveRecord::Migration[7.0] # or your specific Rails version
  def change
    create_table :admired_campaigns do |t|
      t.string :name
      t.text :summary
      t.text :link
      t.boolean :negative
      t.text :reasons, array: true, default: []
      t.references :brief, foreign_key: true
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
