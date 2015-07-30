class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :billing_address, :string
    add_column :users, :billing_city, :string
    add_column :users, :billing_state, :string
    add_column :users, :billing_country, :string
    add_column :users, :drivers_license, :string
    add_column :users, :drivers_license_state, :string
    add_column :users, :drivers_licence_country, :string
    add_column :users, :photo, :string
    add_column :users, :bio, :string
  end
end
