class AddAssociationsToPersonas < ActiveRecord::Migration[7.0]
  def change
    add_reference :personas, :client, foreign_key: true
    add_reference :personas, :brief, foreign_key: true
    add_reference :personas, :user, null: false, foreign_key: true
  end
end
