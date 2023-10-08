class AddBusinessFieldAndBusinessTypeToCompany < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :business_field, :string
    add_column :companies, :business_type, :string
  end
end
