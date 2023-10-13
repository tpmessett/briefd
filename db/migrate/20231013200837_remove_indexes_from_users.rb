class RemoveIndexesFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_index :users, name: "index_users_on_client_id"
    remove_index :users, name: "index_users_on_company_id"
  end
end
