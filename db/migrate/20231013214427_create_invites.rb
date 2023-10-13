class CreateInvites < ActiveRecord::Migration[7.0]
  def change
    create_table :invites do |t|
      t.references :client, foreign_key: true
      t.references :brief, foreign_key: true
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.string :email
      t.string :invite_type
      t.string :source

      t.timestamps
    end
  end
end
