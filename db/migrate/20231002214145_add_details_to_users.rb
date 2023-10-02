class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :position, :string
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :user_type, :string
  end
end
