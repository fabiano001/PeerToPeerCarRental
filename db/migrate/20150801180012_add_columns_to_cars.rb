class AddColumnsToCars < ActiveRecord::Migration
  def change
    add_column :cars, :price, :integer
    add_column :cars, :address, :string
    add_column :cars, :city, :string
    add_column :cars, :state, :string
  end
end
